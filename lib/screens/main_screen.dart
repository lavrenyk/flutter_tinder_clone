import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinder_clone/screens/explore_screen.dart';
import 'package:tinder_clone/screens/likes_screen.dart';
import 'package:tinder_clone/theme/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExploreScreen(),
        LikesScreen(),
        ExploreScreen(),
        ExploreScreen(),
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    var items = [
      pageIndex == 0
          ? 'assets/images/explore_active_icon.svg'
          : 'assets/images/explore_icon.svg',
      pageIndex == 1
          ? 'assets/images/likes_active_icon.svg'
          : 'assets/images/likes_icon.svg',
      pageIndex == 2
          ? 'assets/images/chat_active_icon.svg'
          : 'assets/images/chat_icon.svg',
      pageIndex == 3
          ? 'assets/images/account_active_icon.svg'
          : 'assets/images/account_icon.svg',
    ];
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            items.length,
            (index) => IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: SvgPicture.asset(items[index]),
            ),
          ),
        ),
      ),
    );
  }
}
