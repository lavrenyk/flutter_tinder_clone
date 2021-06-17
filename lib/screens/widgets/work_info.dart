import 'package:flutter/material.dart';

class WorkInfo extends StatelessWidget {
  final String title;
  final int amount;
  final String subTitle;

  const WorkInfo({
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
