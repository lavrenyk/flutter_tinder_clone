import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:tinder_clone/screens/job_details_screen/job_details_screen.dart';
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
              SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    // vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _WorkInfo(
                        title: 'Смена',
                        amount: 12,
                        subTitle: 'часов',
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 50,
                        child: const VerticalDivider(
                          thickness: 1,
                          width: 20,
                        ),
                      ),
                      const _WorkInfo(
                        title: 'Заработок',
                        amount: 1000,
                        subTitle: 'рублей / смена',
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 50,
                        child: const VerticalDivider(
                          thickness: 1,
                          width: 20,
                        ),
                      ),
                      const _WorkInfo(
                        title: 'Доступно',
                        amount: 22,
                        subTitle: 'смены',
                      )
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 0.8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Обязанности:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text('- Погрузочно-разгрузочные работы;'),
                        Text('- Прием товара;'),
                        Text('- Сортировка товара по группам;'),
                        Text('- Участие в инвентаризациях;'),
                        SizedBox(height: 10.0),
                        const Text(
                          'Требования:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text('- Опыт работы на складе от 6 месяцев;'),
                        Text('- Знание технологий складского хозяйства;'),
                        Text('- Уверенное пользование ПК;'),
                        Text(
                            '- Умение организовать, контролировать и обеспечивать полноту и своевременность исполнения работ;'),
                        Text(
                            '- Ответственность, активность, обучаемость, коммуникабельность;'),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, JobDetails.routeName);
                  },
                  child: const Text(
                    'Подробнее',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WorkInfo extends StatelessWidget {
  final String title;
  final int amount;
  final String subTitle;

  const _WorkInfo({
    Key? key,
    required this.title,
    required this.amount,
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title.toUpperCase()),
        Text(
          amount.toString(),
          style: TextStyle(
            height: 1.05,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style: TextStyle(
            height: 0.8,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
