import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_clone/data/data.dart';
import 'package:tinder_clone/data/icons_json.dart';
import 'package:tinder_clone/screens/vacant_jobs_screen.dart';
import 'package:tinder_clone/theme/colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  List itemsTemp = [];
  int itemsLength = 0;
  double swipeLeftPosition = 0;
  double swipeRightPosition = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemsLength = explore_json.length;
    });
  }

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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 60.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const FilterButton(
                    label: 'Показать все',
                    isActive: true,
                  ),
                  const VerticalDivider(),
                  const FilterButton(label: 'Работа на складе'),
                  const FilterButton(label: 'Общепит'),
                  const FilterButton(label: 'Сфера услуг'),
                  const FilterButton(label: 'Охрана'),
                  const FilterButton(label: 'Коммунальное хозяйство'),
                  const FilterButton(label: 'Разнорабочие'),
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 290, top: 10.0),
              height: size.height,
              child: TinderSwapCard(
                totalNum: itemsLength,
                maxWidth: size.width,
                maxHeight: size.height - 20.0,
                minWidth: size.width * 0.75,
                minHeight: size.height * 0.5,
                stackNum: 3,
                cardBuilder: (context, index) => VacantJobs(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                    setState(
                      () {
                        if (align.x > -3) {
                          swipeLeftPosition = 0;
                        } else if (align.x > -6.5) {
                          swipeLeftPosition = 1;
                        } else {
                          swipeLeftPosition = 0;
                        }
                      },
                    );
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                    setState(
                      () {
                        if (align.x < 3) {
                          swipeRightPosition = 0;
                        } else if (align.x < 6.5) {
                          swipeRightPosition = 1;
                        } else {
                          swipeRightPosition = 0;
                        }
                      },
                    );
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  if (orientation == CardSwipeOrientation.LEFT) {
                    setState(() {
                      swipeLeftPosition = 0;
                    });
                  }
                  if (orientation == CardSwipeOrientation.RIGHT) {
                    setState(() {
                      swipeRightPosition = 0;
                    });
                    likes_json
                        .add({'img': itemsTemp[index]['img'], 'active': true});
                  }
                  if (orientation == CardSwipeOrientation.RECOVER) {
                    setState(() {
                      swipeLeftPosition = 0;
                      swipeRightPosition = 0;
                    });
                  }
                },
              ),
            ),
            Positioned(
              right: -5,
              child: Opacity(
                opacity: swipeRightPosition,
                child: Container(
                  height: 200.0,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(
                      color: Colors.green,
                      width: 3.0,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "В ЗАКЛАДКИ".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -5,
              child: Opacity(
                opacity: swipeLeftPosition,
                child: Container(
                  height: 200.0,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(
                      color: Colors.red,
                      width: 3.0,
                    ),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "Неинтересно".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 120,
      decoration: const BoxDecoration(
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(item_icons.length, (index) {
            return Container(
              width: item_icons[index]['size'],
              height: item_icons[index]['size'],
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 5.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  item_icons[index]['icon'],
                  width: item_icons[index]['icon_size'],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const FilterButton({
    Key? key,
    required this.label,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
        onPressed: () {},
        child: Text(label),
        style: TextButton.styleFrom(
          side: const BorderSide(
            width: 1,
            color: Colors.black12,
          ),
          backgroundColor:
              isActive ? Colors.amber.withOpacity(0.5) : Colors.white,
        ),
      ),
    );
  }
}
