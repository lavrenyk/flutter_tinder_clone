import 'package:flutter/widgets.dart';
import 'package:tinder_clone/screens/auth_screen/auth_screen.dart';
import 'package:tinder_clone/screens/job_details_screen/job_details_screen.dart';
import 'package:tinder_clone/screens/job_request_screen/job_request_screen.dart';
import 'package:tinder_clone/screens/main_screen.dart';
import 'package:tinder_clone/screens/user_account/user_account_screen.dart';

final Map<String, WidgetBuilder> routes = {
  AuthScreen.routeName: (context) => const AuthScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  JobDetails.routeName: (context) => const JobDetails(),
  JobRequestScreen.routeName: (context) => const JobRequestScreen(),
  UserAccountScreen.routeName: (context) => const UserAccountScreen(),
};
