import 'package:fit_and_fuel/features/widgets/app_bar.dart';
import 'package:fit_and_fuel/features/widgets/nav_button.dart';
import 'package:fit_and_fuel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => MusicState();
}

class MusicState extends State<Music> {
  late List<bool> isPlaying;
  int? expandedIndex;
  late List<List<String>> playlistItems;

  @override
  void initState() {
    super.initState();
    isPlaying = List<bool>.filled(5, false);
    playlistItems = List.generate(5, (i) => ['Song $i', 'Song ${i + 1}']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text('Featured Music',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD9D9D9))),
              ],
            ),
            ...List.generate(5, (index) {
              final isExpanded = expandedIndex == index;
              return playlistCard(
                heading: 'Playlist ${index + 1}',
                image: 'https://picsum.photos/id/${index + 10}/300/300',
                isActive: isPlaying[index],
                isExpanded: isExpanded,
                items: playlistItems[index],
                onTap: () {
                  setState(() {
                    expandedIndex = isExpanded ? null : index;
                  });
                },
                onPlayTap: () {
                  setState(() {
                    if (isPlaying[index]) {
                      isPlaying[index] = false;
                    } else {
                      for (var i = 0; i < isPlaying.length; i++) {
                        isPlaying[i] = false;
                      }
                      isPlaying[index] = true;
                    }
                  });
                },
              );
            }),
          ],
        ),
      )),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0x0BD9D9D9),
                border: Border(
                    bottom: BorderSide(color: Color(0x7ED9D9D9), width: 1))),
            padding: EdgeInsets.all(7.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://picsum.photos/300/300',
                    width: 45,
                  ),
                ),
                const SizedBox(width: 7.5),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Song 1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD9D9D9),
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Color(0xFF181A20),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Song Author',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0x7ED9D9D9),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.skip_previous,
                      size: 30, color: Color(0xFFD9D9D9)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.play_arrow,
                      // isActive ? Icons.pause : Icons.play_arrow,
                      size: 30,
                      color: Color(0xFFD9D9D9)),
                ),
                GestureDetector(
                  onTap: () {},
                  child:
                      Icon(Icons.skip_next, size: 30, color: Color(0xFFD9D9D9)),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0x0BD9D9D9),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navButton(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  onTap: () {
                    Get.offAllNamed(MyRoutes.homeRoute);
                  },
                ),
                navButton(
                  icon: Icons.description,
                  label: 'Recipes',
                  onTap: () {
                    Get.offAllNamed(MyRoutes.recipeRoute);
                  },
                ),
                activeNavButton(
                  icon: Icons.music_note_sharp,
                  label: 'Music',
                  onTap: () {
                    Get.offAllNamed(MyRoutes.musicRoute);
                  },
                ),
                navButton(
                  icon: Icons.calculate,
                  label: 'Calc.',
                  onTap: () {
                    Get.offAllNamed(MyRoutes.calorieCalculatorRoute);
                  },
                ),
                navButton(
                  icon: Icons.bar_chart_outlined,
                  label: 'Track',
                  onTap: () {
                    Get.offAllNamed(MyRoutes.calorieTrackerRoute);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget playlistCard({
    required String heading,
    required String image,
    required bool isActive,
    required bool isExpanded,
    required List<String> items,
    required VoidCallback onPlayTap,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(image, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              heading,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD9D9D9),
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Color(0xFF181A20),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: onPlayTap,
                              child: Icon(
                                  isActive
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  size: 35,
                                  color: isActive
                                      ? Color(0xFFFCD535)
                                      : Color(0xFFD9D9D9)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  Container(
                    width: double.infinity,
                    color: Color(0x3ED9D9D9),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items
                          .map((song) => Text(song,
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFD9D9D9))))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
