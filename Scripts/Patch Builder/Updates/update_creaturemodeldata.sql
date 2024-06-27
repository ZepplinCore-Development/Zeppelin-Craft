UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.1' /* was 1.0 */
WHERE `id` = '27';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.2' /* was 1.0 */
WHERE `id` = '92';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.3' /* was 1.0 */
WHERE `id` = '144';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.9' /* was 1.0 */
WHERE `id` = '203';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.5' /* was 1.0 */
WHERE `id` = '225';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelPath` = 'Creature\FrostSabre\New\RidingFrostSabre2.mdx' /* was Creature\FrostSabre\RidingFrostSabre.mdx */
WHERE `id` = '457';

UPDATE `dbc`.`creaturemodeldata` SET 
    `mountHeight` = '1.65659' /* was 1.625 */
WHERE `id` = '751';

UPDATE `dbc`.`creaturemodeldata` SET 
    `mountHeight` = '1.65659' /* was 1.625 */
WHERE `id` = '852';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.3' /* was 1.0 */
WHERE `id` = '891';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelPath` = 'Creature\TrollDire2\TrollDire2.mdx' /* was Creature\TrollDire\TrollDire.mdx */
WHERE `id` = '971';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.1' /* was 1.0 */
WHERE `id` = '1071';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.1' /* was 1.0 */
WHERE `id` = '1711';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelPath` = 'Creature\Kodobeast\kodobeastpvpt2.mdx' /* was Creature\Kodobeast\KodoBeastPvPT2.mdx */
WHERE `id` = '1914';

UPDATE `dbc`.`creaturemodeldata` SET 
    `mountHeight` = '1.65659' /* was 1.625 */
WHERE `id` = '1915';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2071';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2197';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '2.5' /* was 1.0 */
WHERE `id` = '2204';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.5' /* was 1.0 */
WHERE `id` = '2261';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.5' /* was 1.0 */
WHERE `id` = '2272';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.5' /* was 1.0 */
WHERE `id` = '2289';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.4' /* was 1.0 */
WHERE `id` = '2320';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2402';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.4' /* was 1.0 */
WHERE `id` = '2418';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2478';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '2.0' /* was 1.0 */
WHERE `id` = '2482';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2489';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.5' /* was 1.0 */
WHERE `id` = '2506';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.5' /* was 1.0 */
WHERE `id` = '2530';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2723';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.9' /* was 1.0 */
WHERE `id` = '2739';

UPDATE `dbc`.`creaturemodeldata` SET 
    `collisionWidth` = '1875.0' /* was 1.875 */
WHERE `id` = '2744';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.5' /* was 1.0 */
WHERE `id` = '2837';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.2' /* was 1.0 */
WHERE `id` = '2858';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '0.8' /* was 1.0 */
WHERE `id` = '2931';

UPDATE `dbc`.`creaturemodeldata` SET 
    `modelScale` = '1.2' /* was 1.0 */
WHERE `id` = '3013';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '3141';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '3141',
`flags` = '4',
`modelPath` = 'Character\Worgen\Male\WorgenMale.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '44',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.29405',
`geoBoxMinX` = '-0.655967',
`geoBoxMinY` = '-1.17623',
`geoBoxMinZ` = '0.000852',
`geoBoxMaxX` = '0.702095',
`geoBoxMaxY` = '1.08036',
`geoBoxMaxZ` = '2.29018',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '3142';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '3142',
`flags` = '4',
`modelPath` = 'Character\Worgen\Female\WorgenFemale.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '44',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.29405',
`geoBoxMinX` = '-0.655967',
`geoBoxMinY` = '-1.17623',
`geoBoxMinZ` = '0.000852',
`geoBoxMaxX` = '0.702095',
`geoBoxMaxY` = '1.08036',
`geoBoxMaxZ` = '2.29018',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '3194';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '3194',
`modelPath` = 'Creature\Hobgoblin\Hobgoblin.mdx',
`sizeClass` = '2',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '3110',
`collisionWidth` = '0.6112',
`collisionHeight` = '2.031',
`mountHeight` = '1.34669',
`geoBoxMinX` = '-0.571247',
`geoBoxMinY` = '-0.994102',
`geoBoxMinZ` = '-0.01056',
`geoBoxMaxX` = '0.590039',
`geoBoxMaxY` = '0.989905',
`geoBoxMaxZ` = '2.81037',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '3441';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '3441',
`modelPath` = 'Creature\Kodobeast\kodobeastbrewfest.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '54.0',
`footprintTextureWidth` = '36.0',
`footprintParticleScale` = '1.0',
`soundData` = '1588',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '3.54287',
`geoBoxMinX` = '-7.3645',
`geoBoxMinY` = '-2.44441',
`geoBoxMinZ` = '-0.017597',
`geoBoxMaxX` = '3.61549',
`geoBoxMaxY` = '2.29475',
`geoBoxMaxZ` = '4.69473',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '3623';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '3623',
`flags` = '12291',
`modelPath` = 'Creature\GoblinTrike\GoblinTrike01.mdx',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`collisionWidth` = '0.6112',
`collisionHeight` = '2.031',
`mountHeight` = '0.540327',
`geoBoxMinX` = '-2.03107',
`geoBoxMinY` = '-0.995891',
`geoBoxMinZ` = '-0.02369',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '3624';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '3624',
`flags` = '12291',
`modelPath` = 'Creature\GoblinTrike\GoblinTrike02.mdx',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`collisionWidth` = '0.6112',
`collisionHeight` = '2.031',
`mountHeight` = '0.540327',
`geoBoxMinX` = '-1.76779',
`geoBoxMinY` = '-1.08014',
`geoBoxMinZ` = '-0.006577',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4000';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4000',
`flags` = '16',
`modelPath` = 'Creature\Tiger\Tiger2.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '82',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.24137',
`geoBoxMinX` = '-2.42837',
`geoBoxMinY` = '-0.658701',
`geoBoxMinZ` = '-0.006203',
`geoBoxMaxX` = '1.02887',
`geoBoxMaxY` = '0.533702',
`geoBoxMaxZ` = '1.2681',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4001';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4001',
`modelPath` = 'Creature\Boar\BoarArmored.mdx',
`sizeClass` = '2',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '3',
`footprintTextureLength` = '9.0',
`footprintTextureWidth` = '6.0',
`footprintParticleScale` = '1.0',
`soundData` = '66',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.14914',
`geoBoxMinY` = '-0.448391',
`geoBoxMinZ` = '-0.029192',
`geoBoxMaxX` = '1.78021',
`geoBoxMaxY` = '0.452119',
`geoBoxMaxZ` = '2.09349',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4002';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4002',
`flags` = '16',
`modelPath` = 'Creature\Tiger\Tigernohair.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '82',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.24137',
`geoBoxMinX` = '-2.42837',
`geoBoxMinY` = '-0.658701',
`geoBoxMinZ` = '-0.006203',
`geoBoxMaxX` = '1.02887',
`geoBoxMaxY` = '0.533702',
`geoBoxMaxZ` = '1.2681',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4003';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4003',
`flags` = '1027',
`modelPath` = 'Creature\AllyChopper\AllyChopper.mdx',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2694',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '0.762392',
`geoBoxMinX` = '-1.92284',
`geoBoxMinY` = '-0.779004',
`geoBoxMinZ` = '-0.074658',
`geoBoxMaxX` = '2.81429',
`geoBoxMaxY` = '1.03197',
`geoBoxMaxZ` = '2.07522',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4004';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4004',
`flags` = '1027',
`modelPath` = 'Creature\HordeChopper\HordeChopper.mdx',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2694',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '0.762392',
`geoBoxMinX` = '-1.92284',
`geoBoxMinY` = '-0.779004',
`geoBoxMinZ` = '-0.074658',
`geoBoxMaxX` = '2.81429',
`geoBoxMaxY` = '1.03197',
`geoBoxMaxZ` = '2.07522',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4005';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4005',
`modelPath` = 'Creature\Kodobeast\KodoBeastwooly.mdx',
`sizeClass` = '3',
`modelScale` = '1.1',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`footstepShakeSize` = '1',
`deathThudShakeSize` = '10',
`soundData` = '27',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '3.54287',
`geoBoxMinX` = '-7.28207',
`geoBoxMinY` = '-2.41275',
`geoBoxMinZ` = '-0.020839',
`geoBoxMaxX` = '3.34308',
`geoBoxMaxY` = '2.2778',
`geoBoxMaxZ` = '5.36694',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4006';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4006',
`modelPath` = 'Creature\FrostSabre\ZulGurub.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '20.0',
`footprintTextureWidth` = '16.0',
`footprintParticleScale` = '1.0',
`soundData` = '1829',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.24137',
`geoBoxMinX` = '-2.43267',
`geoBoxMinY` = '-0.656587',
`geoBoxMinZ` = '-0.036731',
`geoBoxMaxX` = '1.10232',
`geoBoxMaxY` = '0.533901',
`geoBoxMaxZ` = '1.44094',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4007';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4007',
`modelPath` = 'Creature\Ram\BraufestRam.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '1830',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '2.10664',
`geoBoxMinX` = '-1.27503',
`geoBoxMinY` = '-1.08756',
`geoBoxMinZ` = '-0.010213',
`geoBoxMaxX` = '2.31308',
`geoBoxMaxY` = '0.835664',
`geoBoxMaxZ` = '2.61677',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4008';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4008',
`modelPath` = 'Creature\RidingRaptor\ZulGurubRaptor.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '5',
`footprintTextureLength` = '24.0',
`footprintTextureWidth` = '18.0',
`footprintParticleScale` = '1.0',
`soundData` = '1833',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '2.52061',
`geoBoxMinX` = '-4.3277',
`geoBoxMinY` = '-1.11464',
`geoBoxMinZ` = '-0.063824',
`geoBoxMaxX` = '1.97583',
`geoBoxMaxY` = '2.09821',
`geoBoxMaxZ` = '3.44116',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4009';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4009',
`modelPath` = 'Creature\DrakeMount\Stormdragonmount2.mdx',
`modelScale` = '2.0',
`bloodId` = '1',
`footprintTextureId` = '5',
`footprintTextureLength` = '32.0',
`footprintTextureWidth` = '24.0',
`footprintParticleScale` = '1.0',
`soundData` = '2684',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '2.93089',
`geoBoxMinX` = '-7.88614',
`geoBoxMinY` = '-3.0032',
`geoBoxMinZ` = '-0.363761',
`geoBoxMaxX` = '3.12888',
`geoBoxMaxY` = '2.49078',
`geoBoxMaxZ` = '3.57597',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4010';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4010',
`modelPath` = 'Creature\Drake\Stormdragonmount2.mdx',
`modelScale` = '2.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '508',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '2.60073',
`geoBoxMinX` = '-6.45148',
`geoBoxMinY` = '-10.2115',
`geoBoxMinZ` = '-0.551222',
`geoBoxMaxX` = '2.74952',
`geoBoxMaxY` = '10.2109',
`geoBoxMaxZ` = '11.5126',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4011';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4011',
`modelPath` = 'Creature\WARHORSE\PaladinWarHorse.mdx',
`sizeClass` = '1',
`modelScale` = '1.2',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '1869',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86572',
`geoBoxMinX` = '-1.95297',
`geoBoxMinY` = '-0.575566',
`geoBoxMinZ` = '-0.021533',
`geoBoxMaxX` = '2.4062',
`geoBoxMaxY` = '0.509168',
`geoBoxMaxZ` = '2.83061',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4012';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4012',
`modelPath` = 'Creature\Nightfallenmale\Nightfallenmale.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2105',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-0.476729',
`geoBoxMinY` = '-0.566272',
`geoBoxMinZ` = '-0.007271',
`geoBoxMaxX` = '0.384068',
`geoBoxMaxY` = '0.382532',
`geoBoxMaxZ` = '1.9498',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4013';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4013',
`modelPath` = 'Creature\CrackElf\CrackElfMaleRed.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2105',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-0.476729',
`geoBoxMinY` = '-0.566272',
`geoBoxMinZ` = '-0.007271',
`geoBoxMaxX` = '0.384068',
`geoBoxMaxY` = '0.382532',
`geoBoxMaxZ` = '1.9498',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4014';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4014',
`modelPath` = 'Creature\CrackElf\CrackElfMaleBlue.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2105',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-0.476729',
`geoBoxMinY` = '-0.566272',
`geoBoxMinZ` = '-0.007271',
`geoBoxMaxX` = '0.384068',
`geoBoxMaxY` = '0.382532',
`geoBoxMaxZ` = '1.9498',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4015';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4015',
`flags` = '2052',
`modelPath` = 'Creature\ThrallDoomplate\Thrall.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '14.0',
`footprintTextureWidth` = '14.0',
`footprintParticleScale` = '1.0',
`soundData` = '51',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.11705',
`geoBoxMinX` = '-0.725006',
`geoBoxMinY` = '-0.874448',
`geoBoxMinZ` = '-0.006954',
`geoBoxMaxX` = '0.744109',
`geoBoxMaxY` = '0.853355',
`geoBoxMaxZ` = '2.36011',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '4016';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '4016',
`flags` = '2052',
`modelPath` = 'Creature\Voljin\Voljin.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '12.0',
`footprintTextureWidth` = '10.0',
`footprintParticleScale` = '1.0',
`soundData` = '296',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.50425',
`geoBoxMinX` = '-0.958703',
`geoBoxMinY` = '-0.666762',
`geoBoxMinZ` = '0.006144',
`geoBoxMaxX` = '0.902441',
`geoBoxMaxY` = '0.732732',
`geoBoxMaxZ` = '2.63229',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7000';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7000',
`modelPath` = 'Creature\WarHorse\Paladinwarhorse_slow.mdx',
`sizeClass` = '2',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '16.0',
`footprintTextureWidth` = '10.0',
`footprintParticleScale` = '1.0',
`soundData` = '65',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86572',
`geoBoxMinX` = '-1.95297',
`geoBoxMinY` = '-0.464979',
`geoBoxMinZ` = '-0.021533',
`geoBoxMaxX` = '2.04042',
`geoBoxMaxY` = '0.490535',
`geoBoxMaxZ` = '2.54026',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7001';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7001',
`modelPath` = 'Creature\MountainGiant\MoltenGiant.mdx',
`sizeClass` = '3',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`footstepShakeSize` = '2',
`deathThudShakeSize` = '11',
`soundData` = '193',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`geoBoxMinX` = '-2.29473',
`geoBoxMinY` = '-4.1475',
`geoBoxMinZ` = '-0.021338',
`geoBoxMaxX` = '2.47421',
`geoBoxMaxY` = '4.00758',
`geoBoxMaxZ` = '7.679',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '0.75';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7002';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7002',
`modelPath` = 'Creature\Beholder\Beholder_King.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '4294967295',
`footprintTextureId` = '4294967295',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2305',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.27817',
`geoBoxMinX` = '-2.68801',
`geoBoxMinY` = '-2.62894',
`geoBoxMinZ` = '0.529363',
`geoBoxMaxX` = '3.23542',
`geoBoxMaxY` = '3.21663',
`geoBoxMaxZ` = '8.62698',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7003';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7003',
`modelPath` = 'Creature\Felstalker\Felstalker.mdx',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '5',
`footprintTextureLength` = '16.2',
`footprintTextureWidth` = '10.8',
`footprintParticleScale` = '1.0',
`soundData` = '138',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`geoBoxMinX` = '-3.7942',
`geoBoxMinY` = '-1.65846',
`geoBoxMinZ` = '-0.088782',
`geoBoxMaxX` = '2.06211',
`geoBoxMaxY` = '0.951092',
`geoBoxMaxZ` = '2.76812',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7004';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7004',
`flags` = '1',
`modelPath` = 'Creature\draenorkaliri\draenorkaliri.m2',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '350',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.59107',
`geoBoxMinY` = '-2.02893',
`geoBoxMinZ` = '0.46202',
`geoBoxMaxX` = '1.54739',
`geoBoxMaxY` = '2.20409',
`geoBoxMaxZ` = '6.26183',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7005';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7005',
`flags` = '2',
`modelPath` = 'Creature\Succubus_fel\Succubus_fel.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '3',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '37',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.63838',
`geoBoxMinY` = '-0.520597',
`geoBoxMinZ` = '-0.00469',
`geoBoxMaxX` = '0.259531',
`geoBoxMaxY` = '1.23426',
`geoBoxMaxZ` = '2.05441',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7006';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7006',
`modelPath` = 'Creature\Kodobeast\BraufestKodo.mdx',
`sizeClass` = '1',
`modelScale` = '1.1',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '54.0',
`footprintTextureWidth` = '36.0',
`footprintParticleScale` = '1.0',
`soundData` = '1588',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '3.54287',
`geoBoxMinX` = '-7.3645',
`geoBoxMinY` = '-2.44441',
`geoBoxMinZ` = '-0.017597',
`geoBoxMaxX` = '3.61549',
`geoBoxMaxY` = '2.29475',
`geoBoxMaxZ` = '4.69473',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7007';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7007',
`modelPath` = 'Creature\Unicorn\Unicorn_Glow.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '197',
`collisionWidth` = '0.9444',
`collisionHeight` = '2.778',
`geoBoxMinX` = '-1.35447',
`geoBoxMinY` = '-0.468764',
`geoBoxMinZ` = '-0.001343',
`geoBoxMaxX` = '2.44769',
`geoBoxMaxY` = '0.41813',
`geoBoxMaxZ` = '2.70786',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7008';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7008',
`modelPath` = 'Creature\Khadgar2\Khadgar2.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '108',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-0.372525',
`geoBoxMinY` = '-0.516474',
`geoBoxMinZ` = '-0.00081',
`geoBoxMaxX` = '0.431895',
`geoBoxMaxY` = '0.514724',
`geoBoxMaxZ` = '2.01983',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7009';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7009',
`modelPath` = 'Creature\Korkronelitewolf\korkronelitewolf.m2',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '24.0',
`footprintTextureWidth` = '18.0',
`footprintParticleScale` = '1.0',
`soundData` = '73',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.39911',
`geoBoxMinX` = '-2.30695',
`geoBoxMinY` = '-0.575971',
`geoBoxMinZ` = '-0.023982',
`geoBoxMaxX` = '1.58848',
`geoBoxMaxY` = '0.546913',
`geoBoxMaxZ` = '1.87898',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7010';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7010',
`modelPath` = 'Creature\Kobold\Kobold_geweih.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '26',
`collisionWidth` = '0.6944',
`collisionHeight` = '1.389',
`geoBoxMinX` = '-0.981126',
`geoBoxMinY` = '-0.552605',
`geoBoxMinZ` = '-0.008109',
`geoBoxMaxX` = '0.943607',
`geoBoxMaxY` = '0.480619',
`geoBoxMaxZ` = '1.2351',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7011';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7011',
`modelPath` = 'Creature\Kobold\Kobold_knochen.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '26',
`collisionWidth` = '0.6944',
`collisionHeight` = '1.389',
`geoBoxMinX` = '-0.981126',
`geoBoxMinY` = '-0.552605',
`geoBoxMinZ` = '-0.008109',
`geoBoxMaxX` = '0.943607',
`geoBoxMaxY` = '0.480619',
`geoBoxMaxZ` = '1.2351',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7012';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7012',
`modelPath` = 'Creature\darkNaaru\darkNaaru.mdx',
`sizeClass` = '2',
`modelScale` = '1.0',
`bloodId` = '4294967295',
`footprintTextureId` = '4294967295',
`soundData` = '2248',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.40895',
`geoBoxMinY` = '-2.47641',
`geoBoxMinZ` = '0.805461',
`geoBoxMaxX` = '2.46561',
`geoBoxMaxY` = '2.50022',
`geoBoxMaxZ` = '8.06076',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7013';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7013',
`modelPath` = 'Creature\ShivanPriestessfel\ShivanPriestessfel.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '2',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2226',
`geoBoxMinX` = '-0.805182',
`geoBoxMinY` = '-2.7121',
`geoBoxMinZ` = '-0.004211',
`geoBoxMaxX` = '1.68405',
`geoBoxMaxY` = '2.48817',
`geoBoxMaxZ` = '5.31206',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7014';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7014',
`flags` = '2052',
`modelPath` = 'Creature\Tyrande\Tyrande.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '12.0',
`footprintTextureWidth` = '10.0',
`footprintParticleScale` = '1.0',
`soundData` = '56',
`collisionWidth` = '0.555556',
`collisionHeight` = '2.25',
`mountHeight` = '1.33474',
`geoBoxMinX` = '-0.651848',
`geoBoxMinY` = '-0.388641',
`geoBoxMinZ` = '0.001303',
`geoBoxMaxX` = '0.345431',
`geoBoxMaxY` = '0.590205',
`geoBoxMaxZ` = '2.35701',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7015';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7015',
`modelPath` = 'Creature\Jaina\Jaina2.mdx',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.00264',
`geoBoxMinX` = '-0.22917',
`geoBoxMinY` = '-0.340762',
`geoBoxMinZ` = '-0.000769',
`geoBoxMaxX` = '0.261',
`geoBoxMaxY` = '0.351009',
`geoBoxMaxZ` = '1.89786',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7016';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7016',
`modelPath` = 'Creature\FrostSabre\ridingfrostsabrenaked.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '20.0',
`footprintTextureWidth` = '16.0',
`footprintParticleScale` = '1.0',
`soundData` = '1829',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.24137',
`geoBoxMinX` = '-2.43267',
`geoBoxMinY` = '-0.656587',
`geoBoxMinZ` = '-0.036731',
`geoBoxMaxX` = '1.10232',
`geoBoxMaxY` = '0.533901',
`geoBoxMaxZ` = '1.44094',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7017';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7017',
`modelPath` = 'Creature\ShivanPriestessfire\ShivanPriestessfire.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '2',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2226',
`geoBoxMinX` = '-0.805182',
`geoBoxMinY` = '-2.7121',
`geoBoxMinZ` = '-0.004211',
`geoBoxMaxX` = '1.68405',
`geoBoxMaxY` = '2.48817',
`geoBoxMaxZ` = '5.31206',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7018';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7018',
`flags` = '2052',
`modelPath` = 'creature\garrosh2\Garrosh2.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '14.0',
`footprintTextureWidth` = '14.0',
`footprintParticleScale` = '1.0',
`soundData` = '51',
`collisionWidth` = '0.611112',
`collisionHeight` = '2.03128',
`mountHeight` = '1.11705',
`geoBoxMinX` = '-0.733454',
`geoBoxMinY` = '-0.874348',
`geoBoxMinZ` = '-0.006772',
`geoBoxMaxX` = '0.745385',
`geoBoxMaxY` = '0.85349',
`geoBoxMaxZ` = '2.41642',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7019';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7019',
`flags` = '2052',
`modelPath` = 'Creature\bainebloodhoof\Bainebloodhoof.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '3',
`footprintTextureLength` = '22.0',
`footprintTextureWidth` = '16.0',
`footprintParticleScale` = '2.0',
`soundData` = '59',
`collisionWidth` = '0.5903',
`collisionHeight` = '1.653',
`mountHeight` = '0.987215',
`geoBoxMinX` = '-1.0707',
`geoBoxMinY` = '-0.868184',
`geoBoxMinZ` = '-0.010933',
`geoBoxMaxX` = '0.987776',
`geoBoxMaxY` = '0.858508',
`geoBoxMaxZ` = '2.24872',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7020';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7020',
`flags` = '2052',
`modelPath` = 'Creature\Nathanos\Nathanos.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '2',
`footprintTextureId` = '1',
`footprintTextureLength` = '12.0',
`footprintTextureWidth` = '10.0',
`footprintParticleScale` = '1.0',
`soundData` = '57',
`collisionWidth` = '0.694444',
`collisionHeight` = '1.86111',
`mountHeight` = '1.07824',
`geoBoxMinX` = '-0.82306',
`geoBoxMinY` = '-0.530634',
`geoBoxMinZ` = '-0.010859',
`geoBoxMaxX` = '0.406106',
`geoBoxMaxY` = '0.463428',
`geoBoxMaxZ` = '2.10137',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7021';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7021',
`flags` = '2052',
`modelPath` = 'Creature\Saurfang\Saurfang.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '14.0',
`footprintTextureWidth` = '14.0',
`footprintParticleScale` = '1.0',
`soundData` = '51',
`collisionWidth` = '0.611112',
`collisionHeight` = '2.03128',
`mountHeight` = '1.11705',
`geoBoxMinX` = '-0.733454',
`geoBoxMinY` = '-0.874348',
`geoBoxMinZ` = '-0.006772',
`geoBoxMaxX` = '0.745385',
`geoBoxMaxY` = '0.85349',
`geoBoxMaxZ` = '2.41642',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7022';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7022',
`flags` = '16',
`modelPath` = 'Creature\Tiger\DruidTravel.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '82',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.24137',
`geoBoxMinX` = '-2.42837',
`geoBoxMinY` = '-0.658701',
`geoBoxMinZ` = '-0.006203',
`geoBoxMaxX` = '1.02887',
`geoBoxMaxY` = '0.533702',
`geoBoxMaxZ` = '1.2681',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7023';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7023',
`modelPath` = 'Creature\Ent\DuduEnt.mdx',
`modelScale` = '1.0',
`bloodId` = '2',
`footprintTextureId` = '5',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '140',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.45546',
`geoBoxMinY` = '-1.31779',
`geoBoxMinZ` = '-0.080353',
`geoBoxMaxX` = '1.3783',
`geoBoxMaxY` = '1.27791',
`geoBoxMaxZ` = '3.35115',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7024';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7024',
`flags` = '16',
`modelPath` = 'Creature\Tigerloa\Tigerloa.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '7',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '82',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.24137',
`geoBoxMinX` = '-2.42837',
`geoBoxMinY` = '-0.658701',
`geoBoxMinZ` = '-0.006203',
`geoBoxMaxX` = '1.02887',
`geoBoxMaxY` = '0.533702',
`geoBoxMaxZ` = '1.2681',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7025';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7025',
`flags` = '2',
`modelPath` = 'Creature\LavaTarantula\LavaTarantula.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '63',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`geoBoxMinX` = '-2.17774',
`geoBoxMinY` = '-2.88229',
`geoBoxMinZ` = '-0.097646',
`geoBoxMaxX` = '2.78471',
`geoBoxMaxY` = '2.88678',
`geoBoxMaxZ` = '2.39305',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7026';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7026',
`modelPath` = 'Creature\MechanicalChicken\MechanicalChicken.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '5',
`footprintTextureLength` = '4.0',
`footprintTextureWidth` = '3.0',
`footprintParticleScale` = '1.0',
`soundData` = '111',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '0.269092',
`geoBoxMinX` = '-0.268983',
`geoBoxMinY` = '-0.195972',
`geoBoxMinZ` = '-0.002365',
`geoBoxMaxX` = '0.262755',
`geoBoxMaxY` = '0.186011',
`geoBoxMaxZ` = '0.441103',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7027';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7027',
`modelPath` = 'Creature\Horse\Zebra.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '65',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86571',
`geoBoxMinX` = '-1.24386',
`geoBoxMinY` = '-0.436629',
`geoBoxMinZ` = '-0.021972',
`geoBoxMaxX` = '2.00463',
`geoBoxMaxY` = '0.433532',
`geoBoxMaxZ` = '2.63091',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7028';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7028',
`modelPath` = 'Creature\Horse\Horse_hairy.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '65',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86571',
`geoBoxMinX` = '-1.24386',
`geoBoxMinY` = '-0.436629',
`geoBoxMinZ` = '-0.021972',
`geoBoxMaxX` = '2.00463',
`geoBoxMaxY` = '0.433532',
`geoBoxMaxZ` = '2.63091',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7029';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7029',
`modelPath` = 'Creature\RidingHorse\RidingHorsePvPT2_noshield.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '1834',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86572',
`geoBoxMinX` = '-1.40383',
`geoBoxMinY` = '-0.518758',
`geoBoxMinZ` = '-0.023',
`geoBoxMaxX` = '2.00519',
`geoBoxMaxY` = '0.47686',
`geoBoxMaxZ` = '2.67189',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7030';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7030',
`flags` = '2',
`modelPath` = 'Creature\GolemHarvest\GolemHarvestBlue.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '71',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.07359',
`geoBoxMinY` = '-1.48199',
`geoBoxMinZ` = '-0.005854',
`geoBoxMaxX` = '0.728422',
`geoBoxMaxY` = '1.46035',
`geoBoxMaxZ` = '3.38176',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7031';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7031',
`flags` = '2',
`modelPath` = 'Creature\GolemHarvest\GolemHarvestBrown.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '71',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.07359',
`geoBoxMinY` = '-1.48199',
`geoBoxMinZ` = '-0.005854',
`geoBoxMaxX` = '0.728422',
`geoBoxMaxY` = '1.46035',
`geoBoxMaxZ` = '3.38176',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7032';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7032',
`flags` = '2',
`modelPath` = 'Creature\GolemHarvest\GolemHarvestGrey.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '71',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.07359',
`geoBoxMinY` = '-1.48199',
`geoBoxMinZ` = '-0.005854',
`geoBoxMaxX` = '0.728422',
`geoBoxMaxY` = '1.46035',
`geoBoxMaxZ` = '3.38176',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7033';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7033',
`modelPath` = 'Creature\RidingHorse\Horse_Sattel1.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '65',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86572',
`geoBoxMinX` = '-1.24387',
`geoBoxMinY` = '-0.436481',
`geoBoxMinZ` = '-0.021547',
`geoBoxMaxX` = '2.00463',
`geoBoxMaxY` = '0.433532',
`geoBoxMaxZ` = '2.63091',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7034';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7034',
`modelPath` = 'Creature\RidingHorse\Horse_Sattel2.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '65',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.86572',
`geoBoxMinX` = '-1.24387',
`geoBoxMinY` = '-0.436481',
`geoBoxMinZ` = '-0.021547',
`geoBoxMaxX` = '2.00463',
`geoBoxMaxY` = '0.433532',
`geoBoxMaxZ` = '2.63091',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7035';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7035',
`flags` = '3',
`modelPath` = 'Creature\drustvarhag\drustvarhag.mdx',
`modelScale` = '1.3',
`bloodId` = '4294967295',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '142',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`geoBoxMinX` = '-1.51157',
`geoBoxMinY` = '-1.43109',
`geoBoxMinZ` = '-0.018845',
`geoBoxMaxX` = '0.737711',
`geoBoxMaxY` = '1.43236',
`geoBoxMaxZ` = '3.16271',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7036';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7036',
`modelPath` = 'Creature\zandalariraptor\zandalariraptor.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '5',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '34',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '2.52061',
`geoBoxMinX` = '-4.32722',
`geoBoxMinY` = '-1.16399',
`geoBoxMinZ` = '-0.062383',
`geoBoxMaxX` = '1.98767',
`geoBoxMaxY` = '2.09505',
`geoBoxMaxZ` = '3.21134',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7037';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7037',
`flags` = '16',
`modelPath` = 'Creature\TrollDire\TrollDire.mdx',
`sizeClass` = '2',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '868',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`geoBoxMinX` = '-0.722417',
`geoBoxMinY` = '-2.35081',
`geoBoxMinZ` = '-0.012191',
`geoBoxMaxX` = '1.92902',
`geoBoxMaxY` = '2.03523',
`geoBoxMaxZ` = '2.69564',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7038';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7038',
`flags` = '35',
`modelPath` = 'Creature\Bloodgod\Bloodgod.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '24.0',
`footprintParticleScale` = '1.0',
`soundData` = '829',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-4.81412',
`geoBoxMinY` = '-1.82511',
`geoBoxMinZ` = '-0.236798',
`geoBoxMaxX` = '2.89284',
`geoBoxMaxY` = '1.74244',
`geoBoxMaxZ` = '2.23828',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7039';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7039',
`modelPath` = 'Creature\MountainGiantCrystal\MountainGiantCrystal_gelb.mdx',
`sizeClass` = '3',
`modelScale` = '2.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2331',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.29473',
`geoBoxMinY` = '-4.1475',
`geoBoxMinZ` = '-0.021337',
`geoBoxMaxX` = '4.03377',
`geoBoxMaxY` = '4.00758',
`geoBoxMaxZ` = '9.92646',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7040';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7040',
`modelPath` = 'Creature\MountainGiantCrystal\MountainGiantCrystal_red.mdx',
`sizeClass` = '3',
`modelScale` = '2.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2331',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.29473',
`geoBoxMinY` = '-4.1475',
`geoBoxMinZ` = '-0.021337',
`geoBoxMaxX` = '4.03377',
`geoBoxMaxY` = '4.00758',
`geoBoxMaxZ` = '9.92646',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7041';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7041',
`modelPath` = 'Creature\MountainGiantCrystal\MountainGiantCrystal_white.mdx',
`sizeClass` = '3',
`modelScale` = '2.0',
`bloodId` = '3',
`footprintTextureId` = '4',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '2331',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.29473',
`geoBoxMinY` = '-4.1475',
`geoBoxMinZ` = '-0.021337',
`geoBoxMaxX` = '4.03377',
`geoBoxMaxY` = '4.00758',
`geoBoxMaxZ` = '9.92646',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7042';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7042',
`flags` = '9',
`modelPath` = 'Creature\DragonWhelpelementium\DragonWhelpelementium.mdx',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '4294967295',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '6',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`geoBoxMinX` = '-0.752446',
`geoBoxMinY` = '-0.943528',
`geoBoxMinZ` = '0.979083',
`geoBoxMaxX` = '0.637078',
`geoBoxMaxY` = '0.966223',
`geoBoxMaxZ` = '3.19062',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7043';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7043',
`modelPath` = 'Creature\Compy\Compy.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '5',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '34',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '2.52061',
`geoBoxMinX` = '-4.32722',
`geoBoxMinY` = '-1.16399',
`geoBoxMinZ` = '-0.062383',
`geoBoxMaxX` = '1.98767',
`geoBoxMaxY` = '2.09505',
`geoBoxMaxZ` = '3.21134',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7044';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7044',
`flags` = '2',
`modelPath` = 'Creature\Skeleton\Skeleton1.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '70',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`mountHeight` = '1.3914',
`geoBoxMinX` = '-0.606957',
`geoBoxMinY` = '-0.747452',
`geoBoxMinZ` = '-0.01681',
`geoBoxMaxX` = '0.530093',
`geoBoxMaxY` = '0.665247',
`geoBoxMaxZ` = '1.9874',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7045';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7045',
`flags` = '2',
`modelPath` = 'Creature\Skeleton\Skeleton2.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '70',
`collisionWidth` = '0.6944',
`collisionHeight` = '2.083',
`mountHeight` = '1.3914',
`geoBoxMinX` = '-0.606957',
`geoBoxMinY` = '-0.747452',
`geoBoxMinZ` = '-0.01681',
`geoBoxMaxX` = '0.530093',
`geoBoxMaxY` = '0.665247',
`geoBoxMaxZ` = '1.9874',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7046';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7046',
`modelPath` = 'Creature\ancientofwar2diseased\ancientofwar2diseased.mdx',
`sizeClass` = '4',
`modelScale` = '1.0',
`bloodId` = '3',
`footprintTextureId` = '5',
`footprintTextureLength` = '180.0',
`footprintTextureWidth` = '120.0',
`footprintParticleScale` = '10.0',
`footstepShakeSize` = '2',
`deathThudShakeSize` = '11',
`soundData` = '179',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.73428',
`geoBoxMinY` = '-3.70708',
`geoBoxMinZ` = '-0.140285',
`geoBoxMaxX` = '4.59931',
`geoBoxMaxY` = '3.66863',
`geoBoxMaxZ` = '9.40554',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7047';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7047',
`flags` = '2052',
`modelPath` = 'creature\lorthemar\lorthemar.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '12.0',
`footprintTextureWidth` = '10.0',
`footprintParticleScale` = '1.0',
`soundData` = '2155',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '1.16613',
`geoBoxMinX` = '-0.640333',
`geoBoxMinY` = '-0.480391',
`geoBoxMinZ` = '-0.005972',
`geoBoxMaxX` = '0.370374',
`geoBoxMaxY` = '0.437216',
`geoBoxMaxZ` = '2.2295',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7048';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7048',
`flags` = '1',
`modelPath` = 'Creature\Owl\OwlGhost.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '1',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '350',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.59107',
`geoBoxMinY` = '-2.02893',
`geoBoxMinZ` = '0.46202',
`geoBoxMaxX` = '1.54739',
`geoBoxMaxY` = '2.20409',
`geoBoxMaxZ` = '6.26183',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7049';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7049',
`flags` = '2',
`modelPath` = 'Creature\MineSpider\KristallSpider.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '2',
`footprintTextureId` = '4294967295',
`footprintTextureLength` = '18.0',
`footprintTextureWidth` = '12.0',
`footprintParticleScale` = '1.0',
`soundData` = '30',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-2.20257',
`geoBoxMinY` = '-2.19877',
`geoBoxMinZ` = '-0.018529',
`geoBoxMaxX` = '3.88228',
`geoBoxMaxY` = '2.19603',
`geoBoxMaxZ` = '2.0396',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7050';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7050',
`flags` = '1',
`modelPath` = 'Creature\BirdsOfPrey\BirdsOfPrey.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '4294967295',
`soundData` = '390',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`geoBoxMinX` = '-1.49666',
`geoBoxMinY` = '-2.02871',
`geoBoxMinZ` = '0.74859',
`geoBoxMaxX` = '1.7399',
`geoBoxMaxY` = '2.20379',
`geoBoxMaxZ` = '6.26118',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7051';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7051',
`modelPath` = 'Creature\murlocmount\murlocmount.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '54.0',
`footprintTextureWidth` = '36.0',
`footprintParticleScale` = '1.0',
`soundData` = '1588',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '3.54287',
`geoBoxMinX` = '-7.3645',
`geoBoxMinY` = '-2.44441',
`geoBoxMinZ` = '-0.017597',
`geoBoxMaxX` = '3.61549',
`geoBoxMaxY` = '2.29475',
`geoBoxMaxZ` = '4.69473',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

DELETE FROM `dbc`.`creaturemodeldata` WHERE `id` = '7052';
INSERT INTO `dbc`.`creaturemodeldata` SET 
`id` = '7052',
`modelPath` = 'Creature\hordezeppelinmount\hordezeppelinmount.mdx',
`sizeClass` = '1',
`modelScale` = '1.0',
`bloodId` = '1',
`footprintTextureId` = '6',
`footprintTextureLength` = '54.0',
`footprintTextureWidth` = '36.0',
`footprintParticleScale` = '1.0',
`soundData` = '1588',
`collisionWidth` = '0.6111',
`collisionHeight` = '2.031',
`mountHeight` = '3.54287',
`geoBoxMinX` = '-7.3645',
`geoBoxMinY` = '-2.44441',
`geoBoxMinZ` = '-0.017597',
`geoBoxMaxX` = '3.61549',
`geoBoxMaxY` = '2.29475',
`geoBoxMaxZ` = '4.69473',
`worldEffectScale` = '1.0',
`attachedEffectScale` = '1.0';

