class RecentWork {
  final String image, category, title, url;
  final int id;

  RecentWork(
      {required this.id,
      required this.image,
      required this.category,
      required this.url,
      required this.title});
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: "Store-UI-Rest-API",
    category: "Flutter Development",
    image: "assets/images/work1.jpeg",
    url: 'https://github.com/Omarzi/Store-UI-Rest-API',
  ),
  RecentWork(
    id: 2,
    title: "Shoes-Store-UI-Design",
    category: "Flutter Development",
    image: "assets/images/work2.png",
    url: 'https://github.com/Omarzi/Shoes-Store-UI',
  ),
  RecentWork(
    id: 3,
    title: "TODO-Application-with-StateManagement",
    category: "Flutter Development",
    image: "assets/images/work3.jpeg",
    url: 'https://github.com/Omarzi/TODO-App-with-Provider',
  ),
  RecentWork(
    id: 4,
    title: "TikTok-UI",
    category: "Flutter Development",
    image: "assets/images/work4.png",
    url: 'https://github.com/Omarzi/TikTok-UI',
  ),
];
