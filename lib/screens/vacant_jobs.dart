import 'package:flutter/material.dart';
import 'package:tinder_clone/theme/colors.dart';

class VacantJobs extends StatelessWidget {
  const VacantJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: const BoxDecoration(
                color: white,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey.withOpacity(0.1),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/zhivika.jpeg')),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Рабочий склада',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text("Аптека 'Живика'"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 0.8),
              Container(
                // height: 70,
                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    // vertical: 4.0,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('СМЕНА'),
                          Text(
                            '12',
                            style: TextStyle(
                              height: 1.05,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'часов',
                            style: TextStyle(
                              height: 0.8,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 50,
                        child: const VerticalDivider(
                          thickness: 1,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 0.8),
            ],
          ),
        ],
      ),
    );
  }
}
