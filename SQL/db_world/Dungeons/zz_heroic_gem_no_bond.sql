CREATE TEMPORARY TABLE temp_heroic_gems (entry INT);
INSERT INTO temp_heroic_gems VALUES 
    (30546), (30547), (30548), (30549), (30550),
    (30551), (30552), (30553), (30554), (30555),
    (30556), (30558), (30559), (30560), (30563),
    (30564), (30565), (30566), (30567), (30572),
    (30573), (30574), (30575), (30581), (30582),
    (30583), (30584), (30585), (30586), (30587),
    (30588), (30589), (30590), (30591), (30592),
    (30593), (30594), (30600), (30601), (30602),
    (30603), (30604), (30605), (30606), (30607),
    (30608);

UPDATE `item_template`
SET `bonding` = 0, `Flags` = 4096
WHERE `entry` IN (SELECT entry FROM temp_heroic_gems);

DROP TEMPORARY TABLE temp_heroic_gems;