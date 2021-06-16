import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/job_details_screen/components/body.dart';
import 'package:tinder_clone/screens/job_details_screen/components/bottom_bar.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Аптека "Живика"',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey.withOpacity(0.1),
                image: const DecorationImage(
                    image: AssetImage('assets/images/zhivika.jpeg')),
              ),
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
