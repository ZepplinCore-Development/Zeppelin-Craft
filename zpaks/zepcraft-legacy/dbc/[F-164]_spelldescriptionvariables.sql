UPDATE spelldescriptionvariables SET var = '$apbonus=${\*0.25}\n$dmg=${$m1+$<apbonus>}\n$blocktext2=Grants $900120s1% increased block chance for $900120d.\n$blocktext1=Grants $900180s1% increased block chance for $900180d.' WHERE id = 189;

UPDATE spelldescriptionvariables SET var = CONCAT('$apbonus=${$AP*0.25}', CHAR(10), '$dmg=${$m1+$<apbonus>}', CHAR(10), '$blocktext2=Grants $900120s1% increased block chance for $900120d.', CHAR(10), '$blocktext1=Grants $900180s1% increased block chance for $900180d.') WHERE id = 189;
