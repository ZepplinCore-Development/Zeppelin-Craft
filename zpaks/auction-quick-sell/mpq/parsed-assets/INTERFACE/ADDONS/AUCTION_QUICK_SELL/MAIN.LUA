AucQS = {}

-- Saved variable (persisted between sessions)
local settings

-- AH deposit faction multiplier
local AH_DEPOSIT_MULT = 1.5

-- Auction duration: 1 = 12h, 2 = 24h, 3 = 48h
local AUCTION_DURATION = 1

-- Quality constants
local GREY   = 0
local WHITE  = 1
local GREEN  = 2
local BLUE   = 3
local PURPLE = 4
local ORANGE = 5

local QUALITY_NAMES = {
    [GREY]   = "\124cff888888Grey\124r",
    [WHITE]  = "\124cffffffffWhite\124r",
    [GREEN]  = "\124cff1eff00Green\124r",
    [BLUE]   = "\124cff0070ddBlue\124r",
    [PURPLE] = "\124cffa335eePurple\124r",
    [ORANGE] = "\124cffff8000Orange\124r",
}

-- Bot buy-price multipliers: vendor sell price * multiplier = expected AH price
-- Source: mod-ah-bot-plus CalculateItemValue() effective rates (F-156)
-- Keys are itemType strings from GetItemInfo(), values are per-quality multipliers
local MULTIPLIERS = {
    ["Weapon"]      = { [GREY]=1,   [WHITE]=1,    [GREEN]=2.2,  [BLUE]=4.8,  [PURPLE]=6.3,  [ORANGE]=6.3  },
    ["Armor"]       = { [GREY]=1,   [WHITE]=1,    [GREEN]=2.2,  [BLUE]=4.8,  [PURPLE]=6.3,  [ORANGE]=6.3  },
    ["Trade Goods"] = { [GREY]=1,   [WHITE]=0.8,  [GREEN]=1.7,  [BLUE]=1.8,  [PURPLE]=1.9,  [ORANGE]=1.9  },
    ["Gem"]         = { [GREY]=1,   [WHITE]=1,    [GREEN]=2.2,  [BLUE]=2.3,  [PURPLE]=1.9,  [ORANGE]=1.9  },
    ["Consumable"]  = { [GREY]=1,   [WHITE]=1,    [GREEN]=1.8,  [BLUE]=1.9,  [PURPLE]=2.1,  [ORANGE]=2.1  },
    ["Recipe"]      = { [GREY]=1,   [WHITE]=1,    [GREEN]=3.6,  [BLUE]=3.8,  [PURPLE]=42,   [ORANGE]=42   },
    ["Reagent"]     = { [GREY]=1,   [WHITE]=1.6,  [GREEN]=1.8,  [BLUE]=1.9,  [PURPLE]=2.1,  [ORANGE]=2.1  },
    ["Glyph"]       = { [GREY]=1,   [WHITE]=14,   [GREEN]=1.8,  [BLUE]=1.9,  [PURPLE]=2.1,  [ORANGE]=2.1  },
    ["Quest"]       = { [GREY]=1,   [WHITE]=1,    [GREEN]=1.8,  [BLUE]=13.3, [PURPLE]=16.8, [ORANGE]=16.8 },
}
local DEFAULT_MULT  = { [GREY]=1,   [WHITE]=1,    [GREEN]=1.8,  [BLUE]=1.9,  [PURPLE]=2.1,  [ORANGE]=2.1  }

-- Category display order for /aucqs currentvalues
local CATEGORY_ORDER = {
    "Weapon", "Armor", "Trade Goods", "Gem", "Consumable",
    "Recipe", "Reagent", "Glyph", "Quest",
}

-- Current auction item data
local itemName, itemTexture, itemCount, itemQuality, itemCanUse
local itemVendor, itemPricePerUnit, itemStackCount, itemTotalCount
local bid, buyout
local sellButton

local frame = CreateFrame("Frame")
local events = {}

-- ============================================================
-- Utility
-- ============================================================

local function round_to_5s(copper)
    if copper < 500 then return copper end
    return math.floor((copper + 250) / 500) * 500
end

local function get_multiplier(quality)
    if not itemName then return DEFAULT_MULT[quality] or 1 end
    local _, _, _, _, _, itemType = GetItemInfo(itemName)
    if not itemType then return DEFAULT_MULT[quality] or 1 end

    -- Check user overrides first
    if settings.custom_multipliers[itemType] and settings.custom_multipliers[itemType][quality] then
        return settings.custom_multipliers[itemType][quality]
    end

    local cat = MULTIPLIERS[itemType] or DEFAULT_MULT
    return cat[quality] or 1
end

local function bool_to_str(val)
    return val and "On" or "Off"
end

local function format_money(copper)
    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local cop = copper % 100
    if gold > 0 then
        return string.format("%dg %ds %dc", gold, silver, cop)
    elseif silver > 0 then
        return string.format("%ds %dc", silver, cop)
    else
        return string.format("%dc", cop)
    end
end

-- ============================================================
-- Auction logic
-- ============================================================

local function prepare_item()
    if not itemQuality or not itemVendor or itemVendor == 0 then
        bid = 0
        buyout = 0
        return
    end

    local vendor_per_unit = itemVendor / itemCount
    local mult = get_multiplier(itemQuality)
    bid = round_to_5s(math.floor(vendor_per_unit * mult * settings.down_scale_bid))
    buyout = round_to_5s(math.floor(vendor_per_unit * mult * settings.down_scale_BO))
end

local function create_auction()
    local money = GetMoney()
    if bid == 0 or buyout == 0 then return end
    if bid > buyout then bid = buyout end

    if settings.sell_all == false then
        local deposit = math.floor(itemVendor * AH_DEPOSIT_MULT) * AUCTION_DURATION
        if money < deposit then
            print("|cffff0000[AucQS]|r Not enough gold for deposit (" .. format_money(deposit) .. ")")
            return
        end
        StartAuction(bid, buyout, AUCTION_DURATION, 1, 1)
    elseif itemStackCount == 1 then
        local deposit = math.floor(itemVendor * AH_DEPOSIT_MULT) * AUCTION_DURATION
        if money < deposit then
            print("|cffff0000[AucQS]|r Not enough gold for deposit (" .. format_money(deposit) .. ")")
            return
        end
        StartAuction(bid, buyout, AUCTION_DURATION, 1, itemTotalCount)
    elseif itemTotalCount < itemStackCount then
        local deposit = math.floor(itemVendor * AH_DEPOSIT_MULT) * AUCTION_DURATION
        if money < deposit then
            print("|cffff0000[AucQS]|r Not enough gold for deposit (" .. format_money(deposit) .. ")")
            return
        end
        StartAuction(bid, buyout, AUCTION_DURATION, 1, itemTotalCount)
    else
        local deposit = math.floor(itemVendor * AH_DEPOSIT_MULT * itemTotalCount) * AUCTION_DURATION
        if money < deposit then
            print("|cffff0000[AucQS]|r Not enough gold for deposit (" .. format_money(deposit) .. ")")
            return
        end
        StartAuction(bid, buyout, AUCTION_DURATION, 1, itemTotalCount)
    end
end

-- ============================================================
-- Sell button (manual mode)
-- ============================================================

local function create_sell_button()
    sellButton = CreateFrame("Button", "AucQS_SellButton", UIParent, "UIPanelButtonTemplate")
    sellButton:SetWidth(100)
    sellButton:SetHeight(50)
    sellButton:SetPoint("TOP", UIParent, "TOP", 0, 0)
    sellButton:SetText("Sell")
    sellButton:SetScript("OnClick", function()
        if not itemName then return end
        prepare_item()
        create_auction()
    end)
end

-- ============================================================
-- Events
-- ============================================================

function events:NEW_AUCTION_UPDATE()
    if not settings then return end
    itemName, itemTexture, itemCount, itemQuality, itemCanUse,
        itemVendor, itemPricePerUnit, itemStackCount, itemTotalCount = GetAuctionSellItemInfo()
    if not itemName then return end
    if settings.is_auto then
        prepare_item()
        create_auction()
    end
end

function events:AUCTION_HOUSE_SHOW()
    if not settings then return end
    if not settings.is_auto then
        create_sell_button()
    end
end

function events:AUCTION_HOUSE_CLOSED()
    if sellButton then
        sellButton:Hide()
    end
end

function events:ADDON_LOADED(addon)
    if string.upper(addon) ~= "AUCTION_QUICK_SELL" then return end

    if AucQS_settings == nil then
        settings = {
            is_auto = false,
            sell_all = false,
            down_scale_bid = 0.98,
            down_scale_BO = 0.99,
            custom_multipliers = {},
        }
    else
        settings = AucQS_settings
        if not settings.custom_multipliers then
            settings.custom_multipliers = {}
        end
    end
end

function events:PLAYER_ENTERING_WORLD()
end

function events:PLAYER_LEAVING_WORLD()
    if settings then
        AucQS_settings = settings
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...)
end)

for k, _ in pairs(events) do
    frame:RegisterEvent(k)
end

-- ============================================================
-- Slash commands
-- ============================================================

SLASH_AQS1 = "/aucqs"
SLASH_AQS2 = "/AucQS"

function SlashCmdList.AQS(msg)
    if not settings then
        print("|cffff0000[AucQS]|r Addon not loaded yet")
        return
    end
    local args = {}
    for word in msg:gmatch("%S+") do
        table.insert(args, word)
    end
    local cmd = args[1] and string.upper(args[1]) or "HELP"

    if cmd == "HELP" then
        print("|cff00ccff[AucQS] Commands:|r")
        print("  /aucqs currentvalues - Show all multipliers and settings")
        print("  /aucqs autochange - Toggle auto-sell mode")
        print("  /aucqs autostate - Show auto-sell state")
        print("  /aucqs stackchange - Toggle stack selling")
        print("  /aucqs stackstate - Show stack sell state")
        print("  /aucqs bidunder [num] - Show/set bid undercut %")
        print("  /aucqs buyoutunder [num] - Show/set buyout undercut %")
        print("  /aucqs category <name> <quality> <value> - Override a category multiplier")
        print("  /aucqs resetcat <name> - Reset category overrides")

    elseif cmd == "CURRENTVALUES" then
        print("|cff00ccff[AucQS] Settings:|r")
        print("  Auto sell: " .. bool_to_str(settings.is_auto))
        print("  Stack sell: " .. bool_to_str(settings.sell_all))
        print(string.format("  Bid scale: %.0f%%", settings.down_scale_bid * 100))
        print(string.format("  Buyout scale: %.0f%%", settings.down_scale_BO * 100))
        print("|cff00ccff[AucQS] Multipliers (vendor sell price x):|r")
        print(string.format("  %-12s %6s %6s %6s %6s %6s %6s", "Category", "Grey", "White", "Green", "Blue", "Purple", "Orange"))
        for _, cat in ipairs(CATEGORY_ORDER) do
            local base = MULTIPLIERS[cat] or DEFAULT_MULT
            local vals = {}
            for q = 0, 5 do
                local v = base[q] or 1
                if settings.custom_multipliers[cat] and settings.custom_multipliers[cat][q] then
                    v = settings.custom_multipliers[cat][q]
                    vals[q] = string.format("|cffffff00%.1fx|r", v)
                else
                    vals[q] = string.format("%.1fx", v)
                end
            end
            print(string.format("  %-12s %6s %6s %6s %6s %6s %6s",
                cat, vals[0], vals[1], vals[2], vals[3], vals[4], vals[5]))
        end

    elseif cmd == "AUTOCHANGE" then
        settings.is_auto = not settings.is_auto
        print("|cff00ccff[AucQS]|r Auto sell: " .. bool_to_str(settings.is_auto))

    elseif cmd == "AUTOSTATE" then
        print("|cff00ccff[AucQS]|r Auto sell: " .. bool_to_str(settings.is_auto))

    elseif cmd == "STACKCHANGE" then
        settings.sell_all = not settings.sell_all
        print("|cff00ccff[AucQS]|r Stack sell: " .. bool_to_str(settings.sell_all))

    elseif cmd == "STACKSTATE" then
        print("|cff00ccff[AucQS]|r Stack sell: " .. bool_to_str(settings.sell_all))

    elseif cmd == "BIDUNDER" then
        if args[2] then
            local val = tonumber(args[2])
            if not val or val > 100 or val < 1 then
                print("|cffff0000[AucQS]|r Bid percent must be 1-100")
            elseif val / 100 >= settings.down_scale_BO then
                print("|cffff0000[AucQS]|r Bid must be less than buyout (" .. (settings.down_scale_BO * 100) .. "%)")
            else
                settings.down_scale_bid = val / 100
            end
        end
        print(string.format("|cff00ccff[AucQS]|r Bid undercut: %.0f%%", settings.down_scale_bid * 100))

    elseif cmd == "BUYOUTUNDER" then
        if args[2] then
            local val = tonumber(args[2])
            if not val or val > 100 or val < 1 then
                print("|cffff0000[AucQS]|r Buyout percent must be 1-100")
            elseif val / 100 <= settings.down_scale_bid then
                print("|cffff0000[AucQS]|r Buyout must be greater than bid (" .. (settings.down_scale_bid * 100) .. "%)")
            else
                settings.down_scale_BO = val / 100
            end
        end
        print(string.format("|cff00ccff[AucQS]|r Buyout undercut: %.0f%%", settings.down_scale_BO * 100))

    elseif cmd == "CATEGORY" then
        -- /aucqs category Weapon green 3.0
        if not args[2] then
            print("|cffff0000[AucQS]|r Usage: /aucqs category <name> <quality> <value>")
            print("  Categories: Weapon, Armor, Trade Goods, Gem, Consumable, Recipe, Reagent, Glyph, Quest")
            print("  Qualities: grey, white, green, blue, purple, orange")
            return
        end
        -- Category name can be two words (Trade Goods)
        local qualArg, valArg
        local catName
        if args[2] and string.upper(args[2]) == "TRADE" and args[3] and string.upper(args[3]) == "GOODS" then
            catName = "Trade Goods"
            qualArg = args[4]
            valArg = args[5]
        else
            catName = args[2]
            qualArg = args[3]
            valArg = args[4]
        end

        if not qualArg or not valArg then
            print("|cffff0000[AucQS]|r Usage: /aucqs category <name> <quality> <value>")
            return
        end

        -- Validate category
        local validCat = nil
        for _, c in ipairs(CATEGORY_ORDER) do
            if string.upper(c) == string.upper(catName) then
                validCat = c
                break
            end
        end
        if not validCat then
            print("|cffff0000[AucQS]|r Unknown category: " .. catName)
            return
        end

        -- Parse quality
        local qualMap = { GREY=0, WHITE=1, GREEN=2, BLUE=3, PURPLE=4, ORANGE=5 }
        local qualIdx = qualMap[string.upper(qualArg)]
        if not qualIdx then
            print("|cffff0000[AucQS]|r Unknown quality: " .. qualArg)
            return
        end

        local newVal = tonumber(valArg)
        if not newVal or newVal < 0 then
            print("|cffff0000[AucQS]|r Multiplier must be a positive number")
            return
        end

        if not settings.custom_multipliers[validCat] then
            settings.custom_multipliers[validCat] = {}
        end
        settings.custom_multipliers[validCat][qualIdx] = newVal
        print(string.format("|cff00ccff[AucQS]|r Set %s %s to %.1fx",
            validCat, QUALITY_NAMES[qualIdx], newVal))

    elseif cmd == "RESETCAT" then
        if not args[2] then
            print("|cffff0000[AucQS]|r Usage: /aucqs resetcat <name>")
            return
        end
        local catName
        if args[2] and string.upper(args[2]) == "TRADE" and args[3] and string.upper(args[3]) == "GOODS" then
            catName = "Trade Goods"
        else
            catName = args[2]
        end
        local validCat = nil
        for _, c in ipairs(CATEGORY_ORDER) do
            if string.upper(c) == string.upper(catName) then
                validCat = c
                break
            end
        end
        if not validCat then
            print("|cffff0000[AucQS]|r Unknown category: " .. catName)
            return
        end
        settings.custom_multipliers[validCat] = nil
        print("|cff00ccff[AucQS]|r Reset " .. validCat .. " to defaults")

    else
        print("|cffff0000[AucQS]|r Unknown command. Type /aucqs help")
    end
end
