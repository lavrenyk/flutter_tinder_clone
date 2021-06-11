import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  static String routeName = '/job_details';

  const JobDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        iconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        title: const Text(
          'Рабочий склада',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/warehouse_worker.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black38,
          )
        ]),
      ),
    );
  }
}
