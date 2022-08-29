class Game {
  late final String name;
  late final String description;
  late final String type;
  late final String image;
  late final String icon;

  late final num score;
  late final num download;
  late final num review;
  late final List<String> imageNetwork;

  Game({
    required this.name,
    required this.description,
    required this.type,
    required this.image,
    required this.icon,
    required this.score,
    required this.download,
    required this.review,
    required this.imageNetwork,
  });

  static List<Game> generateGames() {
    return [
      Game(
        name: 'Mobile Legends Bang Bang',
        description:
            'Join your friends in Mobile Legends: Bang Bang, the brand new 5v5 MOBA showdown, and fight against real players! Choose your favorite heroes and build the perfect team with your comrades-in-arms! 10-second matchmaking, 10-minute battles. Laning, jungling, pushing, and teamfighting, all the fun of PC MOBA and action games in the palm of your hand! Feed your eSports spirit!',
        type: 'Adventure',
        image: 'assets/images/ori1.jpg',
        icon: 'assets/images/ori_logo.png',
        score: 5.0,
        download: 5000,
        review: 246,
        imageNetwork: [
          'assets/images/ori2.jpg',
          'assets/images/ori3.jpg',
          'assets/images/ori4.jpg',
          'assets/images/ori5.jpg',
        ],
      ),
    ];
  }
}

List<Game> allGames = [
  Game(
    name: 'Mobile Legends Bang Bang',
    description:
        'Join your friends in Mobile Legends: Bang Bang, the brand new 5v5 MOBA showdown, and fight against real players! Choose your favorite heroes and build the perfect team with your comrades-in-arms! 10-second matchmaking, 10-minute battles. Laning, jungling, pushing, and teamfighting, all the fun of PC MOBA and action games in the palm of your hand! Feed your eSports spirit!',
    type: 'Adventure',
    image: 'assets/images/ori1.jpg',
    icon: 'assets/images/ori_logo.png',
    score: 5.0,
    download: 5000,
    review: 246,
    imageNetwork: [
      'assets/images/ori2.jpg',
      'assets/images/ori3.jpg',
      'assets/images/ori4.jpg',
      'assets/images/ori5.jpg',
    ],
  ),
  Game(
    name: 'Rayman Legends',
    description:
        'Join your friends in Mobile Legends: Bang Bang, the brand new 5v5 MOBA showdown, and fight against real players! Choose your favorite heroes and build the perfect team with your comrades-in-arms! 10-second matchmaking, 10-minute battles. Laning, jungling, pushing, and teamfighting, all the fun of PC MOBA and action games in the palm of your hand! Feed your eSports spirit!',
    type: 'Adventure',
    image: 'assets/images/rl1.jpg',
    icon: 'assets/images/rl_logo.png',
    score: 5.0,
    download: 5000,
    review: 246,
    imageNetwork: [
      'assets/images/rl2.jpg',
      'assets/images/rl3.jpg',
      'assets/images/rl4.jpg',
      'assets/images/rl5.jpg',
    ],
  ),
];
