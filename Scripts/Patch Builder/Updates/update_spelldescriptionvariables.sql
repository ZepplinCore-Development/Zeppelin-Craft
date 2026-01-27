DELETE FROM `dbc`.`spelldescriptionvariables` WHERE `ID` = 182;
INSERT INTO `dbc`.`spelldescriptionvariables` SET 
    `ID` = 182,
    `Formula` = '$crop1=$?a100010[${$100010m1}][${0}]
$crop2=$?a100011[${$100011m1}][$<crop1>]
$crop3=$?a100012[${$100012m1}][$<crop2>]
$crop4=$?a100013[${$100013m1}][$<crop3>]
$crop5=$?a100014[${$100014m1}][$<crop4>]
$groundspeed=${$m2+$<crop5>}
$groundspeed2=${$m2+($pl-20)*2+$<crop5>}
$flyingspeed=${$m2+$<crop5>}
$flyingspeed2=${$m2+$<crop5>}
$swimspeed=${$m3+$<crop5>}
$swimspeed2=${$m3+($pl-20)*2+$<crop5>}
$speed=${$m2+$<crop5>}
$speed2=${$m2+($pl-20)*2+$<crop5>}';

DELETE FROM `dbc`.`spelldescriptionvariables` WHERE `ID` = 183;
INSERT INTO `dbc`.`spelldescriptionvariables` SET 
    `ID` = 183,
    `Formula` = '$mortar=$?a91203[${1.25}][$?a91202[${1.20}][$?a91201[${1.15}][$?a91200[${1.10}][${1}]]]]
$stone=$?a17619[${1.4}][${1}]
$m=${$<mortar>*$<stone>}
$potion1=${$s1*$<m>}
$potion2=${$s2*$<m>}';

