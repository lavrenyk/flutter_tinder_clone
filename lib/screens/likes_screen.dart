import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:tinder_clone/data/data.dart';
import 'package:tinder_clone/theme/colors.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return ListView(
      padding: const EdgeInsets.only(bottom: 120.0),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "10 likes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Top Pics",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        const Divider(thickness: 0.8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: List.generate(likes_json.length, (index) {
              var likeActive = likes_json[index]['active'];
              var activeText = likeActive ? "Recentle active" : "Offlne";
              return Container(
                width: (size.width - 15) / 2,
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(likes_json[index]['img']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          black.withOpacity(0.25),
                          black.withOpacity(0),
                        ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 8.0,
                                  width: 8.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: likeActive ? green : Colors.red[300],
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  activeText,
                                  style: TextStyle(
                                    color: white,
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
            }),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      height: 120,
      child: Center(
        child: Container(
          width: size.width - 70,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [yellowOne, yellowTwo],
            ),
          ),
          child: const Center(
            child: Text(
              'SEE WHO LIKES YOU',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
