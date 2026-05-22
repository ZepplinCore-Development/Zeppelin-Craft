-- F-177 collateral cleanup: clear orphaned ScriptName on GO 177226
-- ("Book 'Soothsaying for Dummies'").
--
-- F-177 deleted stock npc_professions.cpp, which also contained the
-- go_evil_book_for_dummies GameObjectScript. The book's unlearn-spec
-- flow is redundant under multiple_specializations (players can hold
-- all leather/engineering specialisations concurrently), so clear the
-- ScriptName instead of restoring the deleted C++.

UPDATE gameobject_template SET ScriptName = '' WHERE entry = 177226;
