import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/job_details_screen/components/body.dart';
import 'package:tinder_clone/screens/job_details_screen/components/bottom_bar.dart';
import 'package:tinder_clone/screens/widgets/company_info_app_bar.dart';

class JobDetails extends StatelessWidget {
  static String routeName = '/job_details';

  const JobDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        iconTheme: const IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: const ComapnyInfoAppBar(),
      ),
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
