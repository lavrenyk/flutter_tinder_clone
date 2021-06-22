import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/widgets/job_schedule.dart';
import 'package:tinder_clone/screens/widgets/work_info.dart';

class JobRequestBody extends StatelessWidget {
  const JobRequestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Divider(thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 2,
              child: WorkInfo(title: 'Смена', amount: 12, subTitle: 'часов'),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 50,
              child: const VerticalDivider(),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text('Рабочий график'.toUpperCase()),
                  Text(
                    '8:00-20:00'.toString(),
                    style: const TextStyle(
                      height: 1.05,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
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
          ],
        ),
        const Divider(thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              flex: 3,
              child: WorkInfo(
                title: 'Заработок',
                amount: 1000,
                subTitle: 'рублей / смена',
              ),
            ),
            // ignore: sized_box_for_whitespace
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                child: const VerticalDivider(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text("Выбрано".toUpperCase()),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "10",
                        style: TextStyle(
                          height: 1.05,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("из"),
                      ),
                      const Text(
                        "22",
                        style: TextStyle(
                          height: 1.05,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Text(
                    "рабочих смен",
                    style: TextStyle(
                      height: 0.8,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    contentPadding: EdgeInsets.all(15),
                    title: Text("Доступные смены"),
                    content: Container(
                      width: 350,
                      height: 400,
                      // child: TableCalendar(
                      //   firstDay: DateTime.utc(2010, 10, 16),
                      //   lastDay: DateTime.utc(2030, 3, 14),
                      //   focusedDay: DateTime.now(),
                      // ),
                      child: JobSchedule(),
                    ),
                  ),
                );
              },
              child: Icon(Icons.calendar_today_outlined),
            ),
          ],
        ),
        SizedBox(height: 40),
        const Divider(thickness: 2),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Отправить заявку",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
