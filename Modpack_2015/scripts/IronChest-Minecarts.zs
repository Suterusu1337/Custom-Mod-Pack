
val Screwdriver = <ore:craftingToolScrewdriver>;
val HHammer = <ore:craftingToolHardHammer>;
val Wrench = <ore:craftingToolWrench>;
val Minecraft = <minecraft:minecart>;
val IronChest = <IronChest:BlockIronChest>;
val CopperChest = <IronChest:BlockIronChest:3>;
val SilverChest = <IronChest:BlockIronChest:4>;
val GoldChest = <IronChest:BlockIronChest:1>;
val DiamondChest = <IronChest:BlockIronChest:2>;
val CrystalChest = <IronChest:BlockIronChest:5>;
val ObsidianChest = <IronChest:BlockIronChest:6>;
val DirtChest = <IronChest:BlockIronChest:7>;


//remove Recipes

//Dirt Chest
recipes.remove(<ironchestminecarts:minecart_chest_dirtchest9000>);
//Iron Chest
recipes.remove(<ironchestminecarts:minecart_chest_iron>);
//Copper Chest
recipes.remove(<ironchestminecarts:minecart_chest_copper>);
//Silver Chest
recipes.remove(<ironchestminecarts:minecart_chest_silver>);
//Gold Chest
recipes.remove(<ironchestminecarts:minecart_chest_gold>);
//Diamon Chest
recipes.remove(<ironchestminecarts:minecart_chest_diamond>);
//Crystal Chest
recipes.remove(<ironchestminecarts:minecart_chest_crystal>);
//Obsidian Chest
recipes.remove(<ironchestminecarts:minecart_chest_obsidian>);


// --- Alternate Cart Recipes ---
//Iron Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_iron>, [
[HHammer, IronChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Copper Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_copper>, [
[HHammer, CopperChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Silver Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_silver>, [
[HHammer, SilverChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Gold Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_gold>, [
[HHammer, GoldChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Diamond Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_diamond>, [
[HHammer, DiamondChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Crystal Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_crystal>, [
[HHammer, CrystalChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Obsidian Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_obsidian>, [
[HHammer, ObsidianChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);

//Dirt Chest Cart
recipes.addShaped(<ironchestminecarts:minecart_chest_dirtchest9000>, [
[HHammer, DirtChest, Wrench],
[null, Minecraft, null],
[null, Screwdriver, null]]);