class MyProjectModel {
  final String? name;
  final String? imageUrl;
  final String? description;
  final String? link;

  MyProjectModel({
    this.name,
    this.imageUrl,
    this.description,
    this.link,
  });
}

final List<MyProjectModel> myProjects = [
  MyProjectModel(
    name: "HMSI App - #Flutter",
    imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/kisahcode.appspot.com/o/images%2Fhmsi-logo.png?alt=media&token=60cd34b9-af4d-47cf-bc25-49932b972e11",
    description:
        "HMSI App is simple process to manage organization HMSI, we can create article, event, information, and other.",
    link: "https://github.com/kisahtegar/hmsi_app",
  ),
  MyProjectModel(
    name: "CSGO - Hack only for education #Python",
    imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/kisahcode.appspot.com/o/images%2Fcounter-strike-global-offensive-logo-B877EB5D33-seeklogo.com.png?alt=media&token=89cf8609-5e55-414f-a6c6-c565ee2e3861",
    description:
        "I made simple csgo hack without inject any file. This project contains aimbot, wallhack, charms, triggerbot, no-recoil and more.",
    link: "https://github.com/kisahtegar/CSGO-Hack-Tools",
  ),
  MyProjectModel(
    name: "FroVALO - Valorant Trigger Bot #AHK",
    imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/kisahcode.appspot.com/o/images%2Fvalorant-logo-3D72D9117F-seeklogo.com.png?alt=media&token=5f66d789-6bc4-486b-b5bc-d874dc843df7",
    description:
        "I made this script with AHK. This script will scan your color enemy depend your settings enemy color and if the color is the same it will shoot automatically.",
    link: "https://github.com/kisahtegar/FroVALO",
  ),
  MyProjectModel(
    name: "McDonalds - #Python",
    imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/kisahcode.appspot.com/o/images%2Fmcdonald-s-golden-arches-logo-93483062BF-seeklogo.com.png?alt=media&token=7b16f889-2480-455e-86fa-7fccec181104",
    description: "McDonalds Dekstop app writing in python",
    link: "https://github.com/kisahtegar/McDonalds",
  ),
];
