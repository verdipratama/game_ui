import 'package:flutter/material.dart';
import 'package:game_ui/constants.dart';
import 'package:game_ui/models/game.dart';
import 'package:readmore/readmore.dart';

class GameDetails extends StatelessWidget {
  const GameDetails({Key? key, required this.data}) : super(key: key);

  final Game data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              game: data,
              expandedHeight: 250,
              roundedContainer: 25,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(data.icon, width: 80),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            data.type,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              _buildIconText(
                                data.score.toString(),
                                Colors.amber,
                                Icons.star,
                              ),
                              const SizedBox(width: 5.0),
                              _buildIconText(
                                '${data.download.toString()}k',
                                Colors.amber,
                                Icons.file_download_done_outlined,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: data.imageNetwork.map((game) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            game,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(15.0),
                  child: ReadMoreText(
                    data.description,
                    trimLines: 3,
                    colorClickableText: kOrange,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Ratings and Reviews',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'View',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.score.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48.0,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStar(),
                              const SizedBox(height: 5.0),
                              Text(
                                '${data.review.toString()} reviews',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.maxFinite,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: kOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Text(
                            'Buy',
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildIconText(String text, Color color, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: color, size: 15.0),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Row _buildStar() {
    final List<Color> color = [
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.grey.withOpacity(0.3),
    ];

    return Row(
      children: color.map((e) {
        return Icon(
          Icons.star,
          size: 25,
          color: e,
        );
      }).toList(),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  const DetailSliverDelegate({
    required this.game,
    required this.expandedHeight,
    required this.roundedContainer,
  });

  final Game game;
  final double expandedHeight;
  final double roundedContainer;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          game.image,
          width: screenW,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(
                top: paddingTop,
                left: 15,
                right: 15,
              ),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: kWhite,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - roundedContainer - shrinkOffset,
          child: Container(
            width: screenW,
            height: roundedContainer,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            alignment: Alignment.center,
            child: Container(
              width: 60,
              height: 5,
              color: kOrange,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
