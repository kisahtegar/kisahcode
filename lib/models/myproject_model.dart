class MyProjectModel {
  final String? name;
  final String? imageAsset;
  final String? imageUrl;
  final String? description;
  final String? link;

  MyProjectModel({
    this.name,
    this.imageAsset,
    this.imageUrl,
    this.description,
    this.link,
  });
}

final List<MyProjectModel> myProjects = [
  MyProjectModel(
    name: "HMSI App - #Flutter",
    imageAsset: "assets/images/hmsi-logo.png",
    description:
        "HMSI App is simple process to manage organization HMSI, we can create article, event, information, and other.",
    link: "https://github.com/kisahtegar/hmsi_app",
  ),
  MyProjectModel(
    name: "CSGO - Hack only for education #Python",
    imageUrl:
        "https://seeklogo.com/images/C/counter-strike-global-offensive-logo-B877EB5D33-seeklogo.com.png",
    description:
        "I made simple csgo hack without inject any file. This project contains aimbot, wallhack, charms, triggerbot, no-recoil and more.",
    link: "https://github.com/kisahtegar/CSGO-Hack-Tools",
  ),
  MyProjectModel(
    name: "FroVALO - Valorant Trigger Bot #AHK",
    imageUrl:
        "https://seeklogo.com/images/V/valorant-logo-3D72D9117F-seeklogo.com.png",
    description:
        "I made this script with AHK. This script will scan your color enemy depend your settings enemy color and if the color is the same it will shoot automatically.",
    link: "https://github.com/kisahtegar/FroVALO",
  ),
  MyProjectModel(
    name: "McDonalds - #Python",
    imageUrl:
        "https://seeklogo.com/images/M/mcdonald-s-golden-arches-logo-93483062BF-seeklogo.com.png",
    description: "McDonalds Dekstop app writing in python",
    link: "https://github.com/kisahtegar/McDonalds",
  ),
];
