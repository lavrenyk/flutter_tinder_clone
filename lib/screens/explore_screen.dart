import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_clone/data/data.dart';
import 'package:tinder_clone/data/icons_json.dart';
import 'package:tinder_clone/screens/vacant_jobs_screen.dart';
import 'package:tinder_clone/screens/widgets/girls.dart';
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

    return Container(
      padding: const EdgeInsets.only(bottom: 130, top: 10),
      height: size.height,
      child: TinderSwapCard(
        totalNum: itemsLength,
        maxWidth: size.width,
        maxHeight: size.height - 20.0,
        minWidth: size.width * 0.75,
        minHeight: size.height * 0.6,
        stackNum: 3,
        // cardBuilder: (context, index) => Girls(
        //   size: size,
        //   image: itemsTemp[index]['img'],
        //   name: itemsTemp[index]['name'],
        //   age: itemsTemp[index]['age'],
        //   likes: itemsTemp[index]['likes'],
        // ),
        cardBuilder: (context, index) => VacantJobs(),
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          print(orientation);
          if (orientation == CardSwipeOrientation.RIGHT) {
            print(itemsTemp[index]);
            likes_json.add({'img': itemsTemp[index]['img'], 'active': true});
          }
        },
      ),
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
