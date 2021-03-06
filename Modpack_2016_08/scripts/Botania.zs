import mods.botania.ManaInfusion;

val steel = <ore:ingotSteel>;
val mana = <ore:ingotManaSteel>;
val manasteel = <Botania:manaResource>;
val blocksteel = <ore:blockSteel>;
val framedlivingwood = <Botania:livingwood:3>;
val frameddreamwod = <Botania:dreamwood:3>;
val craftingtable = <minecraft:crafting_table>;

recipes.remove(<Botania:manasteelHelm>);
recipes.remove(<Botania:manasteelChest>);
recipes.remove(<Botania:manasteelLegs>);
recipes.remove(<Botania:manasteelBoots>);
recipes.remove(<Botania:manasteelPick>);
recipes.remove(<Botania:manasteelShovel>);
recipes.remove(<Botania:manasteelAxe>);
recipes.remove(<Botania:manasteelSword>);
recipes.remove(<Botania:manasteelShears>);
recipes.remove(<Botania:terrasteelHelm>);
recipes.remove(<Botania:terrasteelChest>);
recipes.remove(<Botania:terrasteelLegs>);
recipes.remove(<Botania:terrasteelBoots>);
recipes.remove(<Botania:terraSword>);
recipes.remove(<Botania:terraPick>);
recipes.remove(<Botania:elementiumHelm>);
recipes.remove(<Botania:elementiumChest>);
recipes.remove(<Botania:elementiumLegs>);
recipes.remove(<Botania:elementiumBoots>);
recipes.remove(<Botania:elementiumPick>);
recipes.remove(<Botania:elementiumShovel>);
recipes.remove(<Botania:elementiumAxe>);
recipes.remove(<Botania:elementiumSword>);
recipes.remove(<Botania:elementiumShears>);

// Botania Nerf
mods.botania.ManaInfusion.removeRecipe(<Botania:manaResource>);
mods.botania.ManaInfusion.addInfusion(<Botania:manaResource>, steel, 1000);

mods.botania.ManaInfusion.removeRecipe(<Botania:storage>);
mods.botania.ManaInfusion.addInfusion(<Botania:storage>, blocksteel, 5000);

// Botania Woods a la Gregtech sauce
// All it takes are Oredictionary registrations

// Livingwood
val livingwood = <Botania:livingwood:0>;
val livingwoodSlab = <Botania:livingwood0Slab:0>;
val livingwoodPlank = <Botania:livingwood:1>;
val livingwoodPlankSlab = <Botania:livingwood1Slab:0>;
<ore:logWood>.add(livingwood);
<ore:plankWood>.add(livingwoodPlank);
<ore:slabWood>.add(livingwoodSlab);
<ore:slabWood>.add(livingwoodPlankSlab);

// Dreamwood
val dreamwood = <Botania:dreamwood:0>;
val dreamwoodSlab = <Botania:dreamwood0Slab:0>;
val dreamwoodPlank = <Botania:dreamwood:1>;
val dreamwoodPlankSlab = <Botania:dreamwood1Slab:0>;
<ore:logWood>.add(dreamwood);
<ore:plankWood>.add(dreamwoodPlank);
<ore:slabWood>.add(dreamwoodSlab);
<ore:slabWood>.add(dreamwoodPlankSlab);

// ShimmerWood
val shimmerWoodPlanks = <Botania:shimmerwoodPlanks>;
val shimmerWoodPlanksSlab = <Botania:shimmerwoodPlanks0Slab>;
<ore:plankWood>.add(shimmerWoodPlanks);
<ore:slabWood>.add(shimmerWoodPlanksSlab);

// livingwood slabs need a dedicated recipe tweak
var toolSaw = <ore:craftingToolSaw>;
recipes.removeShaped(livingwoodSlab * 6,[[livingwood,livingwood,livingwood]]);
recipes.addShaped(livingwoodSlab * 2,[[toolSaw,livingwood]]);

// framedLivingwood

recipes.remove(framedlivingwood);
recipes.addShaped(framedlivingwood, [
  [livingwoodPlank, null, livingwoodPlank],
  [null, null, null],
  [livingwoodPlank, null, livingwoodPlank]
]);

recipes.remove(frameddreamwod);
recipes.addShaped(frameddreamwod, [
  [dreamwoodPlank, null, dreamwoodPlank],
  [null, null, null],
  [dreamwoodPlank, null, dreamwoodPlank]
]);
