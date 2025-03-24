UPDATE `character_spell`
SET `spell` = CASE
    WHEN `spell` = 62195 THEN 91074 -- Elementium Aegis
    WHEN `spell` = 80812 THEN 91081 -- Elementium Targeting Matrix
    WHEN `spell` = 62203 THEN 91076 -- Elementium Talisman
    WHEN `spell` = 30555 THEN 91079 -- Thorium Headed Arrows   
    WHEN `spell` = 23052 THEN 91085 -- Black Diamond Dragonling   
    ELSE `spell`
END;

UPDATE `skilllineability`
SET `spellId` = CASE
    WHEN `spellId` = 62195 THEN 91074 -- Elementium Aegis
    WHEN `spellId` = 80812 THEN 91081 -- Elementium Targeting Matrix
    WHEN `spellId` = 62203 THEN 91076 -- Elementium Talisman
    WHEN `spellId` = 30555 THEN 91079 -- Thorium Headed Arrows   
    WHEN `spellId` = 23052 THEN 91085 -- Black Diamond Dragonling  
    ELSE `spellId`
END;
