import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/job_request_screen/components/job_request_body.dart';
import 'package:tinder_clone/screens/widgets/company_info_app_bar.dart';

class JobRequestScreen extends StatelessWidget {
  static String routeName = '/job_request';

  const JobRequestScreen({Key? key}) : super(key: key);

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
      body: const JobRequestBody(),
    );
  }
}
