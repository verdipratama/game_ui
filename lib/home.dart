import 'package:flutter/material.dart';
import 'package:game_ui/constants.dart';
import 'package:game_ui/game_details.dart';
import 'package:game_ui/models/category.dart';
import 'package:game_ui/models/game.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // pading
    final double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Transform(
                transform: Matrix4.identity()..rotateZ(20.0),
                origin: const Offset(150, 50),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200.0,
                ),
              ),
              Positioned(
                right: 0.0,
                top: 200,
                child: Transform(
                  transform: Matrix4.identity()..rotateZ(20.0),
                  origin: const Offset(180, 100),
                  child: Image.asset(
                    'assets/images/bg_liquid.png',
                    width: 200.0,
                  ),
                ),
              ),
              Column(
                children: [
                  // ? HEADER AREA
                  Container(
                    padding: EdgeInsets.only(
                      top: paddingTop,
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi, Verdi Pratama',
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'What would you like to play?',
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          child: Image.asset(
                            'assets/images/team_member05.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ? SEARCHBAR
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 30.0,
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            fillColor: kWhite,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 20,
                            ),
                            prefixIcon: const Icon(Icons.search, size: 25.0),
                            hintText: 'Search all games..',
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 6.0,
                          right: 12.0,
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Icon(
                              Icons.mic_outlined,
                              color: kWhite,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // MAIN
                  Container(
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          padding: const EdgeInsets.all(20.0),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: catlist.length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.0),
                                      color: catlist[index]['color'] as Color,
                                    ),
                                    child: Icon(
                                      catlist[index]['icon'] as IconData,
                                      color: kWhite,
                                      size: 30.0,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    catlist[index]['title'] as String,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, __) {
                              return const SizedBox(width: 33.0);
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          width: double.maxFinite,
                          child: const Text(
                            'Popular Games',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: allGames.length,
                            itemBuilder: (context, index) {
                              final Game game = allGames[index];

                              return GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                    builder: (context) =>
                                        GameDetails(data: game),
                                  );
                                  Navigator.push(context, route);
                                },
                                child: Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(game.image),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          width: double.maxFinite,
                          child: const Text(
                            'Latest Games',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: allGames.map((game) {
                              return Container(
                                padding: const EdgeInsets.all(12.0),
                                margin: const EdgeInsets.only(bottom: 20.0),
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        game.icon,
                                        width: 60.0,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            game.name,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    game.type,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2.0),
                                                  _buildStar(),
                                                ],
                                              ),
                                              _buildButton(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: kBackgroundColor,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              selectedItemColor: kOrange,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              type: BottomNavigationBarType.fixed,
              items: [
                _buildNavigationItem('Home', Icons.home_rounded),
                _buildNavigationItem('Application', Icons.more_horiz_outlined),
                _buildNavigationItem('Film', Icons.play_arrow_outlined),
                _buildNavigationItem('Book', Icons.auto_stories_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Row _buildStar() {
    return Row(
      children: starColor.map((e) {
        return Icon(
          Icons.star,
          size: 15,
          color: e,
        );
      }).toList(),
    );
  }

  Container _buildButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Text(
        'Buy',
        style: TextStyle(
          fontSize: 12.0,
          color: kWhite,
        ),
      ),
    );
  }
}
