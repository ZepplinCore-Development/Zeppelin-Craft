-- =============================================================================
-- IPP Quest Orphan Cleanup
-- =============================================================================
-- mod-individual-progression removes certain quest_template rows during phase
-- restrictions, but leaves behind orphaned rows in quest_request_items and
-- quest_offer_reward. This cleanup removes those orphaned rows.
-- =============================================================================

DELETE FROM `quest_request_items`
WHERE `ID` NOT IN (SELECT `ID` FROM `quest_template`);

DELETE FROM `quest_offer_reward`
WHERE `ID` NOT IN (SELECT `ID` FROM `quest_template`);
