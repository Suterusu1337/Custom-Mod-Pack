import mods.ic2.Compressor;

val ULVCasing = <gregtech:gt.blockcasings>;
val LVCasing = <gregtech:gt.blockcasings:1>;
val MVCasing = <gregtech:gt.blockcasings:2>;

val ULVHull = <gregtech:gt.blockmachines:10>;
val LVHull = <gregtech:gt.blockmachines:11>;
val MVHull = <gregtech:gt.blockmachines:12>;

val LeadCable = <gregtech:gt.blockmachines:1226>;
val TinCable = <gregtech:gt.blockmachines:1246>;
val TinCableBare = <gregtech:gt.blockmachines:1240>;
val CopperCable = <gregtech:gt.blockmachines:1366>;

val WIronPlate = <gregtech:gt.metaitem.01:17304>;
val SteelPlate = <ore:plateSteel>;
val AluminiumPlate = <gregtech:gt.metaitem.01:17019>;
val ZincPlate = <gregtech:gt.metaitem.01:17036>;

val RubberBar = <gregtech:gt.metaitem.01:11880>;

val moltenRubber = <liquid:molten.rubber>;

val ic24 = <gregtech:gt.integrated_circuit:24> * 0;

// ULVHull
recipes.remove(ULVHull);
recipes.addShaped(ULVHull,
 [[ZincPlate, WIronPlate, ZincPlate],
  [LeadCable, ULVCasing, LeadCable],
  [null, null, null]]);
  
// LVHull
recipes.remove(LVHull);
recipes.addShaped(LVHull,
 [[ZincPlate, SteelPlate, ZincPlate],
  [TinCable, LVCasing, TinCable],
  [null, null, null]]);
 
// MVHull
recipes.remove(MVHull);
recipes.addShaped(MVHull,
 [[ZincPlate, AluminiumPlate, ZincPlate],
  [CopperCable, LVCasing, CopperCable],
  [null, null, null]]);

// Tin Cable Alloy Smelter
//OutputStack, InputStack1, InputStack2, Time in Ticks, EnergyUsage
mods.gregtech.AlloySmelter.addRecipe(TinCable, TinCableBare, RubberBar * 2, 100, 16);

// Refined Item Casing
recipes.remove(<IC2:itemCasing:5>);
recipes.addShaped(<IC2:itemCasing:5> * 2,
 [[<ore:craftingToolHardHammer>, ZincPlate, SteelPlate],
  [null, null, null],
  [null, null, null]]);

// circuit
recipes.remove(<IC2:itemPartCircuit>);	
recipes.addShaped(<IC2:itemPartCircuit>,
 [[CopperCable, CopperCable, CopperCable],
  [<gregtech:gt.metaitem.01:32700>, <IC2:itemCasing:5>, <gregtech:gt.metaitem.01:32700>],
  [CopperCable, CopperCable, CopperCable]]);  

// OC Diamond Chip
recipes.remove(<OpenComputers:item:111>);
recipes.addShaped(<OpenComputers:item:111> * 6,
 [[null, <ore:craftingToolHardHammer>, null],
  [null, <ore:gemDiamond>, null],
  [null, <ore:craftingToolFile>, null]]);

//Lead Assembler Cables
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1226>, <gregtech:gt.blockmachines:1220>, ic24, moltenRubber * 144, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1227>, <gregtech:gt.blockmachines:1221>, ic24, moltenRubber * 144, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1228>, <gregtech:gt.blockmachines:1222>, ic24, moltenRubber * 288, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1229>, <gregtech:gt.blockmachines:1223>, ic24, moltenRubber * 432, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1230>, <gregtech:gt.blockmachines:1224>, ic24, moltenRubber * 576, 100, 8);

// Tin Assembler Cables
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1246>, <gregtech:gt.blockmachines:1240>, ic24, moltenRubber * 144, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1247>, <gregtech:gt.blockmachines:1241>, ic24, moltenRubber * 144, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1248>, <gregtech:gt.blockmachines:1242>, ic24, moltenRubber * 288, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1249>, <gregtech:gt.blockmachines:1243>, ic24, moltenRubber * 432, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:1250>, <gregtech:gt.blockmachines:1244>, ic24, moltenRubber * 576, 100, 8);

// Red Alloy Cables
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:2006>, <gregtech:gt.blockmachines:2000>, ic24, moltenRubber * 144, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:2007>, <gregtech:gt.blockmachines:2001>, ic24, moltenRubber * 144, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:2008>, <gregtech:gt.blockmachines:2002>, ic24, moltenRubber * 288, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:2009>, <gregtech:gt.blockmachines:2003>, ic24, moltenRubber * 432, 100, 8);
mods.gregtech.Assembler.addRecipe(<gregtech:gt.blockmachines:2010>, <gregtech:gt.blockmachines:2004>, ic24, moltenRubber * 576, 100, 8);

Compressor.addRecipe(<minecraft:dye:4> * 9,<minecraft:lapis_block>);
Compressor.addRecipe(<minecraft:redstone> * 9,<minecraft:redstone_block>);
Compressor.addRecipe(<minecraft:gold_nugget> * 9,<minecraft:gold_ingot>);

// Remove Cookie
recipes.remove(<gregtech:gt.metaitem.02:32214>);
