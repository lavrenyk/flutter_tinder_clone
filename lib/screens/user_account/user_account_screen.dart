import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/user_account/components/body.dart';

class UserAccountScreen extends StatelessWidget {
  static String routeName = '/user_account';

  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
