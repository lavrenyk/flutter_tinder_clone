import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/widgets/work_info.dart';

class JobRequestBody extends StatelessWidget {
  const JobRequestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 25.0,
            bottom: 5.0,
          ),
          child: Center(
            child: Text(
              "ЗАЯВКА НА РАБОТУ",
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.green,
              ),
            ),
          ),
        ),
        const Center(
          child: Text(
            "Рабочий склада",
            style: TextStyle(
              fontFamily: "ProximaNova",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Divider(thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.amber,
                child: WorkInfo(title: 'Смена', amount: 12, subTitle: 'часов'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Text('Рабочий график'.toUpperCase()),
                    Text(
                      '8:00-20:00'.toString(),
                      style: TextStyle(
                        height: 1.05,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'с перерывом на обед',
                      style: TextStyle(
                        height: 0.8,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
