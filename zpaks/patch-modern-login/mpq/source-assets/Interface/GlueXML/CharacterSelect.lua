CHARACTER_SELECT_ROTATION_START_X = nil;
CHARACTER_SELECT_INITIAL_FACING = nil;

CHARACTER_ROTATION_CONSTANT = 0.6;

-- F-180: MAX_CHARACTERS_DISPLAYED is the number of visible rows. MAX_CHARACTERS_PER_REALM
-- is the logical cap and must match worldserver.conf CharactersPerRealm. Characters
-- beyond the visible window are reached by mousewheel / arrow keys
-- (CharacterSelect.scrollOffset). Capped at 9: a 10th row collides with the
-- fixed "Create New Character" button at the bottom of the column. (10 physical
-- button widgets exist in the XML; widget 10 is simply never used.)
MAX_CHARACTERS_DISPLAYED = 9;
MAX_CHARACTERS_PER_REALM = 20;

-- Map localized race names to background model names
RACE_TO_BACKGROUND = {
	["Human"]		= "HUMAN",
	["Orc"]			= "Orc",
	["Dwarf"]		= "Dwarf",
	["Night Elf"]	= "NIGHTELF",
	["Undead"]		= "SCOURGE",
	["Tauren"]		= "TAUREN",
	["Gnome"]		= "Gnome",
	["Troll"]		= "ORC",
	["Blood Elf"]	= "BLOODELF",
	["Draenei"]		= "DRAENEI",
	["Worgen"]		= "Worgen",
	["Goblin"]		= "Goblin",
};


function CharacterSelect_OnLoad(self)
	self:SetSequence(0);
	self:SetCamera(0);
	self:SetModelScale(0.85);
	self:SetPosition(0, 0, -0.15);

	self.createIndex = 0;
	self.selectedIndex = 0;
	self.selectLast = 0;
	self.currentModel = nil;
	self:RegisterEvent("ADDON_LIST_UPDATE");
	self:RegisterEvent("CHARACTER_LIST_UPDATE");
	self:RegisterEvent("UPDATE_SELECTED_CHARACTER");
	self:RegisterEvent("SELECT_LAST_CHARACTER");
	self:RegisterEvent("SELECT_FIRST_CHARACTER");
	self:RegisterEvent("SUGGEST_REALM");
	self:RegisterEvent("FORCE_RENAME_CHARACTER");

	SetCharSelectModelFrame("CharacterSelect");

	-- Color edit box backdrops
	local backdropColor = DEFAULT_TOOLTIP_COLOR;
	CharacterSelectCharacterFrame:SetBackdropBorderColor(backdropColor[1], backdropColor[2], backdropColor[3]);
	CharacterSelectCharacterFrame:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6], 0.85);
	
end

function CharacterSelect_OnShow()
	-- request account data times from the server (so we know if we should refresh keybindings, etc...)
	ReadyForAccountDataTimes()
	
	local CurrentModel = CharacterSelect.currentModel;

	if ( CurrentModel ) then
		SetBackgroundModel(CharacterSelect, CurrentModel);
		PlayGlueAmbience(GlueAmbienceTracks[strupper(CurrentModel)], 4.0);
	end

	UpdateAddonButton();

	local serverName, isPVP, isRP = GetServerName();
	local connected = IsConnectedToServer();
	local serverType = "";
	if ( serverName ) then
		if( not connected ) then
			serverName = serverName.."\n("..SERVER_DOWN..")";
		end
		if ( isPVP ) then
			if ( isRP ) then
				serverType = RPPVP_PARENTHESES;
			else
				serverType = PVP_PARENTHESES;
			end
		elseif ( isRP ) then
			serverType = RP_PARENTHESES;
		end
		CharSelectRealmName:SetText(serverName.." "..serverType);
	else
		CharSelectRealmName:Hide();
	end

	if ( connected ) then
		GetCharacterListUpdate();
	else
		UpdateCharacterList();
	end

	-- Gameroom billing stuff (For Korea and China only)
	if ( SHOW_GAMEROOM_BILLING_FRAME ) then
		local paymentPlan, hasFallBackBillingMethod, isGameRoom = GetBillingPlan();
		if ( paymentPlan == 0 ) then
			-- No payment plan
			GameRoomBillingFrame:Hide();
			CharacterSelectRealmSplitButton:ClearAllPoints();
			CharacterSelectRealmSplitButton:SetPoint("TOP", CharacterSelectLogo, "BOTTOM", 0, -5);
		else
			local billingTimeLeft = GetBillingTimeRemaining();
			-- Set default text for the payment plan
			local billingText = _G["BILLING_TEXT"..paymentPlan];
			if ( paymentPlan == 1 ) then
				-- Recurring account
				billingTimeLeft = ceil(billingTimeLeft/(60 * 24));
				if ( billingTimeLeft == 1 ) then
					billingText = BILLING_TIME_LEFT_LAST_DAY;
				end
			elseif ( paymentPlan == 2 ) then
				-- Free account
				if ( billingTimeLeft < (24 * 60) ) then
					billingText = format(BILLING_FREE_TIME_EXPIRE, billingTimeLeft.." "..MINUTES_ABBR);
				end				
			elseif ( paymentPlan == 3 ) then
				-- Fixed but not recurring
				if ( isGameRoom == 1 ) then
					if ( billingTimeLeft <= 30 ) then
						billingText = BILLING_GAMEROOM_EXPIRE;
					else
						billingText = format(BILLING_FIXED_IGR, MinutesToTime(billingTimeLeft, 1));
					end
				else
					-- personal fixed plan
					if ( billingTimeLeft < (24 * 60) ) then
						billingText = BILLING_FIXED_LASTDAY;
					else
						billingText = format(billingText, MinutesToTime(billingTimeLeft));
					end	
				end
			elseif ( paymentPlan == 4 ) then
				-- Usage plan
				if ( isGameRoom == 1 ) then
					-- game room usage plan
					if ( billingTimeLeft <= 600 ) then
						billingText = BILLING_GAMEROOM_EXPIRE;
					else
						billingText = BILLING_IGR_USAGE;
					end
				else
					-- personal usage plan
					if ( billingTimeLeft <= 30 ) then
						billingText = BILLING_TIME_LEFT_30_MINS;
					else
						billingText = format(billingText, billingTimeLeft);
					end
				end
			end
			-- If fallback payment method add a note that says so
			if ( hasFallBackBillingMethod == 1 ) then
				billingText = billingText.."\n\n"..BILLING_HAS_FALLBACK_PAYMENT;
			end
			GameRoomBillingFrameText:SetText(billingText);
			GameRoomBillingFrame:SetHeight(GameRoomBillingFrameText:GetHeight() + 26);
			GameRoomBillingFrame:Show();
			CharacterSelectRealmSplitButton:ClearAllPoints();
			CharacterSelectRealmSplitButton:SetPoint("TOP", GameRoomBillingFrame, "BOTTOM", 0, -10);
		end
	end
	
	if( IsTrialAccount() ) then
		CharacterSelectUpgradeAccountButton:Show();
	else
		CharacterSelectUpgradeAccountButton:Hide();
	end

	-- fadein the character select ui
	GlueFrameFadeIn(CharacterSelectUI, CHARACTER_SELECT_FADE_IN)

	RealmSplitCurrentChoice:Hide();
	RequestRealmSplitInfo();

	--Clear out the addons selected item
	GlueDropDownMenu_SetSelectedValue(AddonCharacterDropDown, ALL);
end

function CharacterSelect_OnHide()
	CharacterDeleteDialog:Hide();
	CharacterRenameDialog:Hide();
	if ( DeclensionFrame ) then
		DeclensionFrame:Hide();
	end
	SERVER_SPLIT_STATE_PENDING = -1;
end

function CharacterSelect_OnUpdate(elapsed)
	if ( SERVER_SPLIT_STATE_PENDING > 0 ) then
		CharacterSelectRealmSplitButton:Show();

		if ( SERVER_SPLIT_CLIENT_STATE > 0 ) then
			RealmSplit_SetChoiceText();
			RealmSplitPending:SetPoint("TOP", RealmSplitCurrentChoice, "BOTTOM", 0, -10);
		else
			RealmSplitPending:SetPoint("TOP", CharacterSelectRealmSplitButton, "BOTTOM", 0, 0);
			RealmSplitCurrentChoice:Hide();
		end

		if ( SERVER_SPLIT_STATE_PENDING > 1 ) then
			CharacterSelectRealmSplitButton:Disable();
			CharacterSelectRealmSplitButtonGlow:Hide();
			RealmSplitPending:SetText( SERVER_SPLIT_PENDING );
		else
			CharacterSelectRealmSplitButton:Enable();
			CharacterSelectRealmSplitButtonGlow:Show();
			local datetext = SERVER_SPLIT_CHOOSE_BY.."\n"..SERVER_SPLIT_DATE;
			RealmSplitPending:SetText( datetext );
		end

		if ( SERVER_SPLIT_SHOW_DIALOG and not GlueDialog:IsShown() ) then
			SERVER_SPLIT_SHOW_DIALOG = false;
			local dialogString = format(SERVER_SPLIT,SERVER_SPLIT_DATE);
			if ( SERVER_SPLIT_CLIENT_STATE > 0 ) then
				local serverChoice = RealmSplit_GetFormatedChoice(SERVER_SPLIT_REALM_CHOICE);
				local stringWithDate = format(SERVER_SPLIT,SERVER_SPLIT_DATE);
				dialogString = stringWithDate.."\n\n"..serverChoice;
				GlueDialog_Show("SERVER_SPLIT_WITH_CHOICE", dialogString);
			else
				GlueDialog_Show("SERVER_SPLIT", dialogString);
			end
		end
	else
		CharacterSelectRealmSplitButton:Hide();
	end

	-- Account Msg stuff
	if ( (ACCOUNT_MSG_NUM_AVAILABLE > 0) and not GlueDialog:IsShown() ) then
		if ( ACCOUNT_MSG_HEADERS_LOADED ) then
			if ( ACCOUNT_MSG_BODY_LOADED ) then
				local dialogString = AccountMsg_GetHeaderSubject( ACCOUNT_MSG_CURRENT_INDEX ).."\n\n"..AccountMsg_GetBody();
				GlueDialog_Show("ACCOUNT_MSG", dialogString);
			end
		end
	end
end

function CharacterSelect_OnKeyDown(self,key)
	if ( key == "ESCAPE" ) then
		CharacterSelect_Exit();
	elseif ( key == "ENTER" ) then
		CharacterSelect_EnterWorld();
	elseif ( key == "PRINTSCREEN" ) then
		Screenshot();
	elseif ( key == "UP" or key == "LEFT" ) then
		local numChars = GetNumCharacters();
		if ( numChars > 1 ) then
			local newIndex;
			if ( self.selectedIndex > 1 ) then
				newIndex = self.selectedIndex - 1;
			else
				newIndex = numChars;
			end
			-- F-180: scroll the target into view before selecting it
			CharacterSelect_ScrollToCharacter(newIndex);
			CharacterSelect_SelectCharacter(newIndex);
		end
	elseif ( key == "DOWN" or key == "RIGHT" ) then
		local numChars = GetNumCharacters();
		if ( numChars > 1 ) then
			local newIndex;
			if ( self.selectedIndex < numChars ) then
				newIndex = self.selectedIndex + 1;
			else
				newIndex = 1;
			end
			-- F-180: scroll the target into view before selecting it
			CharacterSelect_ScrollToCharacter(newIndex);
			CharacterSelect_SelectCharacter(newIndex);
		end
	end
end

function CharacterSelect_OnEvent(self, event, ...)
	if ( event == "ADDON_LIST_UPDATE" ) then
		UpdateAddonButton();
	elseif ( event == "CHARACTER_LIST_UPDATE" ) then
		UpdateCharacterList();
		CharSelectCharacterName:SetText(GetCharacterInfo(self.selectedIndex));
	elseif ( event == "UPDATE_SELECTED_CHARACTER" ) then
		local index = ...;
		if ( index == 0 ) then
			CharSelectCharacterName:SetText("");
		else
			local name, race = GetCharacterInfo(index);
			CharSelectCharacterName:SetText(name);
			self.selectedIndex = index;
			local bgModel = RACE_TO_BACKGROUND[race];
			if ( bgModel and bgModel ~= self.currentModel ) then
				self.currentModel = bgModel;
				SetBackgroundModel(self, bgModel);
			end
		end
		UpdateCharacterSelection(self);
	elseif ( event == "SELECT_LAST_CHARACTER" ) then
		self.selectLast = 1;
	elseif ( event == "SELECT_FIRST_CHARACTER" ) then
		CharacterSelect_SelectCharacter(1, 1);
	elseif ( event == "SUGGEST_REALM" ) then
		local category, id = ...;
		local name = GetRealmInfo(category, id);
		if ( name ) then
			SetGlueScreen("charselect");
			ChangeRealm(category, id);
		else
			if ( RealmList:IsShown() ) then
				RealmListUpdate();
			else
				RealmList:Show();
			end
		end
	elseif ( event == "FORCE_RENAME_CHARACTER" ) then
		local message = ...;
		CharacterRenameDialog:Show();
		CharacterRenameText1:SetText(_G[message]);
	end
end

function CharacterSelect_UpdateModel(self)
	UpdateSelectionCustomizationScene();
	self:AdvanceTime();
end

function UpdateCharacterSelection(self)
	for i=1, MAX_CHARACTERS_DISPLAYED, 1 do
		_G["CharSelectCharacterButton"..i]:UnlockHighlight();
	end

	-- F-180: selectedIndex is a real character index; translate it to the
	-- visible button slot using the current scroll offset before highlighting.
	local offset = CharacterSelect_GetScrollOffset();
	local index = self.selectedIndex;
	local slot = index - offset;
	if ( (index > 0) and (slot >= 1) and (slot <= MAX_CHARACTERS_DISPLAYED) ) then
		_G["CharSelectCharacterButton"..slot]:LockHighlight();
	end
end

-- F-180: current scroll offset, in whole characters. Tracked as a plain value
-- on CharacterSelect (there is no scrollbar widget); always returned clamped to
-- the valid range so the list can never show blank rows past the last character.
function CharacterSelect_GetScrollOffset()
	local offset = CharacterSelect.scrollOffset or 0;
	local maxOffset = CharacterSelect_GetMaxOffset();
	if ( offset < 0 ) then
		offset = 0;
	elseif ( offset > maxOffset ) then
		offset = maxOffset;
	end
	return offset;
end

-- F-180: largest valid scroll offset (in characters) - the list stops here so
-- you cannot scroll past the last character into blank space.
function CharacterSelect_GetMaxOffset()
	local maxOffset = GetNumCharacters() - MAX_CHARACTERS_DISPLAYED;
	if ( maxOffset < 0 ) then
		maxOffset = 0;
	end
	return maxOffset;
end

-- F-180: set the scroll offset (clamped to a hard top/bottom) and repaint only
-- if it actually changed.
function CharacterSelect_SetScrollOffset(offset)
	local maxOffset = CharacterSelect_GetMaxOffset();
	if ( offset < 0 ) then
		offset = 0;
	elseif ( offset > maxOffset ) then
		offset = maxOffset;
	end
	if ( CharacterSelect.scrollOffset ~= offset ) then
		CharacterSelect.scrollOffset = offset;
		UpdateCharacterList();
	end
end

-- F-180: keep a given (real) character index inside the visible window.
function CharacterSelect_ScrollToCharacter(index)
	local offset = CharacterSelect_GetScrollOffset();
	if ( index <= offset ) then
		CharacterSelect_SetScrollOffset(index - 1);
	elseif ( index > offset + MAX_CHARACTERS_DISPLAYED ) then
		CharacterSelect_SetScrollOffset(index - MAX_CHARACTERS_DISPLAYED);
	end
end

-- F-180: mousewheel scrolling. delta is +1 (wheel up) / -1 (wheel down).
function CharacterSelect_OnMouseWheel(self, delta)
	CharacterSelect_SetScrollOffset(CharacterSelect_GetScrollOffset() - delta);
end

function UpdateCharacterList()
	local numChars = GetNumCharacters();
	local connected = IsConnectedToServer();

	-- F-180: character count above the list (turns red at the per-realm cap).
	CharSelectCharacterListCount:SetFormattedText("Characters: %d / %d", numChars, MAX_CHARACTERS_PER_REALM);
	if ( numChars >= MAX_CHARACTERS_PER_REALM ) then
		CharSelectCharacterListCount:SetTextColor(1.0, 0.3, 0.3);
	else
		CharSelectCharacterListCount:SetTextColor(1.0, 0.82, 0.0);
	end

	-- F-180: drive the visible buttons from the scroll offset so we can browse
	-- up to MAX_CHARACTERS_PER_REALM characters with only MAX_CHARACTERS_DISPLAYED
	-- physical button widgets.
	local offset = CharacterSelect_GetScrollOffset();

	CharacterSelect.createIndex = 0;
	CharSelectCreateCharacterButton:Hide();

	for i=1, MAX_CHARACTERS_DISPLAYED, 1 do
		local button = _G["CharSelectCharacterButton"..i];
		local charIndex = offset + i;	-- the real character this slot represents

		-- always start with the paid-service buttons hidden for this slot
		_G["CharSelectCharacterCustomize"..i]:Hide();
		_G["CharSelectRaceChange"..i]:Hide();
		_G["CharSelectFactionChange"..i]:Hide();

		if ( charIndex <= numChars ) then
			local name, race, class, level, zone, sex, ghost, PCC, PRC, PFC = GetCharacterInfo(charIndex);
			button:SetID(charIndex);
			if ( not name ) then
				button:SetText("ERROR - Tell Jeremy");
			else
				if ( not zone ) then
					zone = "";
				end
				_G["CharSelectCharacterButton"..i.."ButtonTextName"]:SetText(name);
				if( ghost ) then
					_G["CharSelectCharacterButton"..i.."ButtonTextInfo"]:SetFormattedText(CHARACTER_SELECT_INFO_GHOST, level, class);
				else
					_G["CharSelectCharacterButton"..i.."ButtonTextInfo"]:SetFormattedText(CHARACTER_SELECT_INFO, level, class);
				end
				_G["CharSelectCharacterButton"..i.."ButtonTextLocation"]:SetText(zone);
			end
			button:Show();

			-- setup paid service buttons (keyed to the real character index)
			if ( PFC ) then
				local svc = _G["CharSelectFactionChange"..i];
				svc:SetID(charIndex);
				svc:Show();
			elseif ( PRC ) then
				local svc = _G["CharSelectRaceChange"..i];
				svc:SetID(charIndex);
				svc:Show();
			elseif ( PCC ) then
				local svc = _G["CharSelectCharacterCustomize"..i];
				svc:SetID(charIndex);
				svc:Show();
			end
		else
			button:Hide();
		end
	end

	if ( numChars == 0 ) then
		CharacterSelectDeleteButton:Disable();
		CharSelectEnterWorldButton:Disable();
	else
		CharacterSelectDeleteButton:Enable();
		CharSelectEnterWorldButton:Enable();
	end

	-- The "create new character" button keeps its fixed position from the XML
	-- (it is not part of the scrollable list). createIndex is the logical slot
	-- past the last character, used by CharacterSelect_SelectCharacter.
	if ( numChars < MAX_CHARACTERS_PER_REALM ) then
		CharacterSelect.createIndex = numChars + 1;
		if ( connected ) then
			CharSelectCreateCharacterButton:SetID(CharacterSelect.createIndex);
			CharSelectCreateCharacterButton:Show();
		end
	end

	if ( numChars == 0 ) then
		CharacterSelect.selectedIndex = 0;
		CharacterSelect_SelectCharacter(CharacterSelect.selectedIndex, 1);
		UpdateCharacterSelection(CharacterSelect);
		return;
	end

	if ( CharacterSelect.selectLast == 1 ) then
		CharacterSelect.selectLast = 0;
		CharacterSelect_ScrollToCharacter(numChars);
		CharacterSelect_SelectCharacter(numChars, 1);
		UpdateCharacterSelection(CharacterSelect);
		return;
	end

	if ( (CharacterSelect.selectedIndex == 0) or (CharacterSelect.selectedIndex > numChars) ) then
		CharacterSelect.selectedIndex = 1;
	end
	-- F-180: do NOT scroll-to-selection here. UpdateCharacterList runs on every
	-- repaint, including mousewheel scrolls; forcing the selected character back
	-- into view would undo the scroll (you could not wheel past a selected top or
	-- bottom character). Scrolling is independent of selection - the selection is
	-- moved into view only when it actually changes (arrow keys, select-last).
	CharacterSelect_SelectCharacter(CharacterSelect.selectedIndex, 1);
	UpdateCharacterSelection(CharacterSelect);
end

function CharacterSelectButton_OnClick(self)
	local id = self:GetID();
	if ( id ~= CharacterSelect.selectedIndex ) then
		CharacterSelect_SelectCharacter(id);
	end
end

function CharacterSelectButton_OnDoubleClick(self)
	local id = self:GetID();
	if ( id ~= CharacterSelect.selectedIndex ) then
		CharacterSelect_SelectCharacter(id);
	end
	CharacterSelect_EnterWorld();
end

function CharacterSelect_TabResize(self)
	local buttonMiddle = _G[self:GetName().."Middle"];
	local buttonMiddleDisabled = _G[self:GetName().."MiddleDisabled"];
	local width = self:GetTextWidth() - 8;
	local leftWidth = _G[self:GetName().."Left"]:GetWidth();
	buttonMiddle:SetWidth(width);
	buttonMiddleDisabled:SetWidth(width);
	self:SetWidth(width + (2 * leftWidth));
end

function CharacterSelect_SelectCharacter(id, noCreate)
	if ( id == CharacterSelect.createIndex ) then
		if ( not noCreate ) then
			PlaySound("gsCharacterSelectionCreateNew");
			SetGlueScreen("charcreate");
		end
	else
		local name, race = GetCharacterInfo(id);
		local bgModel = RACE_TO_BACKGROUND[race];
		if ( bgModel ) then
			CharacterSelect.currentModel = bgModel;
			SetBackgroundModel(CharacterSelect, CharacterSelect.currentModel);
		end

		SelectCharacter(id);
	end
end

function CharacterDeleteDialog_OnShow()
	local name, race, class, level = GetCharacterInfo(CharacterSelect.selectedIndex);
	CharacterDeleteText1:SetFormattedText(CONFIRM_CHAR_DELETE, name, level, class);
	CharacterDeleteBackground:SetHeight(16 + CharacterDeleteText1:GetHeight() + CharacterDeleteText2:GetHeight() + 23 + CharacterDeleteEditBox:GetHeight() + 8 + CharacterDeleteButton1:GetHeight() + 16);
	CharacterDeleteButton1:Disable();
end

function CharacterSelect_EnterWorld()
	PlaySound("gsCharacterSelectionEnterWorld");
	StopGlueAmbience();
	EnterWorld();
end

function CharacterSelect_Exit()
	PlaySound("gsCharacterSelectionExit");
	DisconnectFromServer();
	SetGlueScreen("login");
end

function CharacterSelect_AccountOptions()
	PlaySound("gsCharacterSelectionAcctOptions");
end

function CharacterSelect_TechSupport()
	PlaySound("gsCharacterSelectionAcctOptions");
	LaunchURL(TECH_SUPPORT_URL);
end

function CharacterSelect_Delete()
	PlaySound("gsCharacterSelectionDelCharacter");
	if ( CharacterSelect.selectedIndex > 0 ) then
		CharacterDeleteDialog:Show();
	end
end

function CharacterSelect_ChangeRealm()
	PlaySound("gsCharacterSelectionDelCharacter");
	RequestRealmList(1);
end

function CharacterSelectFrame_OnMouseDown(button)
	if ( button == "LeftButton" ) then
		CHARACTER_SELECT_ROTATION_START_X = GetCursorPosition();
		CHARACTER_SELECT_INITIAL_FACING = GetCharacterSelectFacing();
	end
end

function CharacterSelectFrame_OnMouseUp(button)
	if ( button == "LeftButton" ) then
		CHARACTER_SELECT_ROTATION_START_X = nil
	end
end

function CharacterSelectFrame_OnUpdate()
	if ( CHARACTER_SELECT_ROTATION_START_X ) then
		local x = GetCursorPosition();
		local diff = (x - CHARACTER_SELECT_ROTATION_START_X) * CHARACTER_ROTATION_CONSTANT;
		CHARACTER_SELECT_ROTATION_START_X = GetCursorPosition();
		SetCharacterSelectFacing(GetCharacterSelectFacing() + diff);
	end
end

function CharacterSelectRotateRight_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterSelectFacing(GetCharacterSelectFacing() + CHARACTER_FACING_INCREMENT);
	end
end

function CharacterSelectRotateLeft_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterSelectFacing(GetCharacterSelectFacing() - CHARACTER_FACING_INCREMENT);
	end
end

function CharacterSelect_ManageAccount()
	PlaySound("gsCharacterSelectionAcctOptions");
	LaunchURL(AUTH_NO_TIME_URL);
end

function RealmSplit_GetFormatedChoice(formatText)
	if ( SERVER_SPLIT_CLIENT_STATE == 1 ) then
		realmChoice = SERVER_SPLIT_SERVER_ONE;
	else
		realmChoice = SERVER_SPLIT_SERVER_TWO;
	end
	return format(formatText, realmChoice);
end

function RealmSplit_SetChoiceText()
	RealmSplitCurrentChoice:SetText( RealmSplit_GetFormatedChoice(SERVER_SPLIT_CURRENT_CHOICE) );
	RealmSplitCurrentChoice:Show();
end

function CharacterSelect_PaidServiceOnClick(self, button, down, service)
	PAID_SERVICE_CHARACTER_ID = self:GetID();
	PAID_SERVICE_TYPE = service;
	PlaySound("gsCharacterSelectionCreateNew");
	SetGlueScreen("charcreate");
end

function CharacterSelect_DeathKnightSwap(self)
	if ( CharacterSelect.currentModel == "DEATHKNIGHT" ) then
		if (self.currentModel ~= "DEATHKNIGHT") then
			self.currentModel = "DEATHKNIGHT";
			self:SetNormalTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Up-Blue");
			self:SetPushedTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Down-Blue");
			self:SetHighlightTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Highlight-Blue");
		end
	else
		if (self.currentModel == "DEATHKNIGHT") then
			self.currentModel = nil;
			self:SetNormalTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Up");
			self:SetPushedTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Down");
			self:SetHighlightTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Highlight");
		end
	end
end

