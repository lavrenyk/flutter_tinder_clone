import 'package:flutter/material.dart';

class SelectVacantJobsType extends StatefulWidget {
  const SelectVacantJobsType({Key? key}) : super(key: key);

  @override
  State<SelectVacantJobsType> createState() => _SelectVacantJobsTypeState();
}

class _SelectVacantJobsTypeState extends State<SelectVacantJobsType> {
  bool isVacantJobsTypeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Работа рядом!',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Работа в Москве!',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
