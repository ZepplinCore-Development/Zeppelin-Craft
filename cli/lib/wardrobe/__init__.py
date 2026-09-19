"""
NPC wardrobe (F-198): author character-model NPC appearances from retail items.

Pipeline: manifest -> retail item resolve (wago.tools DB2 + CASC) -> asset import
(texture components as-is, item models downported + classic batch rewrite) ->
bake compositor -> BLP -> DBC / world SQL emit.
"""
