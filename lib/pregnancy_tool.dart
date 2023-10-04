class PregnancyTool {
  final String name;
  final String imageAsset;
  final String description;

  PregnancyTool(
      {required this.name,
      required this.imageAsset,
      required this.description});
}

final List<PregnancyTool> firstTrimester = [
  PregnancyTool(
    name: "Prenatal Vitamins",
    imageAsset: "images/tools/pills.png",
    description: "Description for prenatal vitamins.",
  ),
  PregnancyTool(
    name: "Stretch Mark Prevention",
    imageAsset: "images/tools/stretch_marks_preven.png",
    description: "Description for stretch mark prevention.",
  ),
  PregnancyTool(
    name: "Stretch Mark Prevention",
    imageAsset: "images/tools/stretch_marks_preven.png",
    description: "Description for stretch mark prevention.",
  ),
  // Add more tools here
];

final List<PregnancyTool> secondTrimester = [
  PregnancyTool(
    name: "Pregnancy \nPillow",
    imageAsset: "images/tools/pillow.png",
    description: "Description for Pregnancy Pillow.",
  ),
  PregnancyTool(
    name: "Maternity \nbra",
    imageAsset: "images/tools/maternity_bra.jpg",
    description: "Description for Pregnancy Pillow",
  ),
  // Add more tools here
];

final List<PregnancyTool> thirdTrimester = [
  PregnancyTool(
    name: "Newborn \nclothes",
    imageAsset: "images/tools/clothes.png",
    description: "Description for Pregnancy Pillow.",
  ),
  PregnancyTool(
    name: "Bottle \nWarmer",
    imageAsset: "images/tools/bottle.png",
    description: "Description for Pregnancy Pillow",
  ),
  // Add more tools here
];
