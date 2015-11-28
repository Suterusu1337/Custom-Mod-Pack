// --- Created by SuterusuKusanagi
 
// --- Importing Stuff ---
 
import mods.nei.NEI;
 
// --- Variables ---
 
val IronBolt = <gregtech:gt.metaitem.01:26032>;
val IronRod = <gregtech:gt.metaitem.01:23032>;
val SteelBolt = <gregtech:gt.metaitem.01:26305>;
val SteelFrame = <gregtech:gt.blockmachines:4401>;
val SteelRod = <gregtech:gt.metaitem.01:23305>;
val WoodLogs = <ore:logWood>;
val Wrench = <gregtech:gt.metatool.01:16>;
 
// --- Removing Recipes ---
 
//Remove the vanilla recipes for beams
recipes.removeShaped(<gorgiastuff:BlockBeamBasic>);
recipes.removeShaped(<gorgiastuff:BlockBeamReinforced>);
recipes.removeShaped(<gorgiastuff:BlockBeamMetal>);
 
// --- Adding Back Recipes ---
 
// --- Basic Beam
recipes.addShaped(<gorgiastuff:BlockBeamBasic> * 4, [
[IronBolt, WoodLogs, IronBolt],
[WoodLogs, Wrench, WoodLogs],
[IronBolt, WoodLogs, IronBolt]]);
 
// --- Reinforced Beam
recipes.addShaped(<gorgiastuff:BlockBeamReinforced> * 2, [
[SteelBolt, <gorgiastuff:BlockBeamBasic>, SteelBolt],
[SteelRod, Wrench, SteelRod],
[SteelBolt, <gorgiastuff:BlockBeamBasic>, SteelBolt]]);
 
// --- Metal Beam
recipes.addShaped(<gorgiastuff:BlockBeamMetal> * 2, [
[SteelBolt, <gorgiastuff:BlockBeamReinforced>, SteelBolt],
[SteelFrame, Wrench, SteelFrame],
[SteelBolt, <gorgiastuff:BlockBeamReinforced>, SteelBolt]]);
 
// --- Hiding Stuff ---