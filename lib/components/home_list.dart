class HomeList {
  final String title;
  final String image;
  final String description;

  HomeList({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<HomeList> homelist = [
  HomeList(
    title: "demo title",
    description: "demo descript",
    image: 'assets/images/drive.png',
  ),
];
