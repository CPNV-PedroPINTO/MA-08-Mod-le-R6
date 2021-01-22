
CREATE VIEW V_RainbowSix AS SELECT * FROM 
	(SELECT COUNT(*) AS "Characters" FROM Characters) as Characters,
    (SELECT COUNT(*) AS "Gadgets" FROM Gadgets) as Gadgets,
    (SELECT COUNT(*) AS "Accessories" FROM Accessories) as Accessories,
	(SELECT COUNT(*) AS "Maps" FROM Maps) as Maps,
    (SELECT COUNT(*) AS "Mods" FROM Mods) as Mods,
	(SELECT COUNT(*) AS "Pendants" FROM Pendants) as Pendants,
	(SELECT COUNT(*) AS "Rewards" FROM Rewards) as Rewards,
	(SELECT COUNT(*) AS "Skins" FROM Skins) as Skins,
	(SELECT COUNT(*) AS "Stat" FROM Stat) as Stat,
	(SELECT COUNT(*) AS "Weapons" FROM Weapons) as Weapons
	;

	