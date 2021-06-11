import 'package:flutter/widgets.dart';
import 'package:tinder_clone/screens/job_details_screen.dart';
import 'package:tinder_clone/screens/main_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => const MainScreen(),
  JobDetails.routeName: (context) => const JobDetails(),
};
