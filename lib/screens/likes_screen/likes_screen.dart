import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/likes_screen/components/body.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
