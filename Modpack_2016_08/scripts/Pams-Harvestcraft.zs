//Created by Lefty

// VARS
val mortar = <ore:toolMortarandpestle>;
val cutboard = <ore:toolCuttingboard>;
val bowl = <ore:toolMixingbowl>;
val bake = <ore:toolBakeware>;
val juice = <ore:toolJuicer>;
val Cotton = <harvestcraft:cottonItem>;
val String = <minecraft:string>;

val Dough = <ore:foodDough>;
val Butter = <ore:foodButter>;
val Beef = <minecraft:beef>;
val Mushroom = <ore:listAllmushroom>;
val Onion = <harvestcraft:onionItem>;
val Spinach = <harvestcraft:spinachItem>;

recipes.remove(<harvestcraft:market>);
recipes.remove(<harvestcraft:saltItem>);
recipes.remove(<harvestcraft:mixingbowlItem>);
recipes.remove(<harvestcraft:cuttingboardItem>);
recipes.remove(<harvestcraft:mortarandpestleItem>);
recipes.remove(<harvestcraft:bakewareItem>);
recipes.remove(<harvestcraft:juicerItem>);
recipes.remove(<harvestcraft:flourItem>);
recipes.remove(<harvestcraft:pamcandleDeco1>);
recipes.remove(<harvestcraft:pamcandleDeco2>);
recipes.remove(<harvestcraft:pamcandleDeco3>);
recipes.remove(<harvestcraft:pamcandleDeco4>);
recipes.remove(<harvestcraft:pamcandleDeco5>);
recipes.remove(<harvestcraft:pamcandleDeco6>);
recipes.remove(<harvestcraft:pamcandleDeco7>);
recipes.remove(<harvestcraft:pamcandleDeco8>);
recipes.remove(<harvestcraft:pamcandleDeco9>);
recipes.remove(<harvestcraft:pamcandleDeco10>);
recipes.remove(<harvestcraft:pamcandleDeco11>);
recipes.remove(<harvestcraft:pamcandleDeco12>);
recipes.remove(<harvestcraft:pamcandleDeco13>);
recipes.remove(<harvestcraft:pamcandleDeco14>);
recipes.remove(<harvestcraft:pamcandleDeco15>);
recipes.remove(<harvestcraft:pamcandleDeco16>);
mortar.add(<gregtech:gt.metatool.01:24>);
cutboard.add(<gregtech:gt.metatool.01:34>);
bowl.add(<minecraft:bowl>);
bake.add(<gregtech:gt.metatool.01:46>);
juice.add(<gregtech:gt.metatool.01:14>);

// -------------------------------- Custom ModPack -----------------------------------------

// String from Cotton
recipes.addShaped(String,
 [[Cotton, Cotton, Cotton],
  [Cotton, null, Cotton],
  [Cotton, Cotton, Cotton]]);
  
// Butter
recipes.remove(<harvestcraft:butterItem>);
recipes.addShapeless(<harvestcraft:butterItem> * 4, [<ore:toolSaucepan>, <ore:foodHeavycream>, <ore:itemSalt>]);

// Cheese
recipes.remove(<harvestcraft:cheeseItem>);
recipes.addShapeless(<harvestcraft:cheeseItem> * 4, [<ore:toolPot>, <ore:itemSalt>]);

// Salt
recipes.remove(<gregtech:gt.metaitem.01:2817>);
recipes.addShapeless(<gregtech:gt.metaitem.01:2817> * 2, [<gregtech:gt.blockores:817>, <ore:toolMortarandpestle>]);

// Hearty Breakfast
recipes.remove(<harvestcraft:heartybreakfastItem>);
recipes.addShapeless(<harvestcraft:heartybreakfastItem>, [<minecraft:cooked_porkchop>, <harvestcraft:friedeggItem>, <harvestcraft:toastItem>, <harvestcraft:potatocakesItem>, <ore:listAlljuice>]);

// Beef Wellington
recipes.remove(<harvestcraft:beefwellingtonItem>);
recipes.addShapeless(<harvestcraft:beefwellingtonItem>,[bake, Beef, Dough, Butter, Mushroom, Onion, Spinach]);

//Epic Bacon
recipes.remove(<harvestcraft:epicbaconItem>);
recipes.addShapeless(<harvestcraft:epicbaconItem>,[<harvestcraft:maplecandiedbaconItem>,<ore:dyeRed>, <ore:dyeOrange>, <ore:dyeYellow>, <ore:dyeGreen>, <ore:dyeBlue>, <ore:dyePurple>, <ore:dyeMagenta>]);