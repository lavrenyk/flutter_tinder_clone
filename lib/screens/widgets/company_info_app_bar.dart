import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ComapnyInfoAppBar extends StatelessWidget {
  const ComapnyInfoAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Аптека "Живика"',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            RatingBarIndicator(
              rating: 4.5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15.0,
              direction: Axis.horizontal,
            ),
          ],
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
    );
  }
}
