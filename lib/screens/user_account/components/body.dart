import 'dart:ui';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 100,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 50,
                ),
                const SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      '@lavrenyk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const Text(
                      "ДИМА ЛАВРЕНЮК",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const Text(
                      "+7 (915) 008-88-84",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          const Divider(thickness: 0.5),
          const SizedBox(height: 5.0),

          Container(
            height: 80,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/worker-male.png',
                          height: 60,
                        ),
                        const Text(
                          'НОВИЧОК',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const LevelUpIndicator(active: true),
                          const LevelUpIndicator(),
                          const LevelUpIndicator(),
                          const LevelUpIndicator(),
                          const LevelUpIndicator(),
                        ],
                      ),
                      const SizedBox(height: 13.0),
                      const Text(
                        'До нового уровня 4 смены',
                        style: TextStyle(fontSize: 13.0),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Expanded(
                    flex: 1,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.help_outline_rounded,
                          color: Colors.black38,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 0.5),
        ],
      ),
    );
  }
}

class LevelUpIndicator extends StatelessWidget {
  final bool active;

  const LevelUpIndicator({
    Key? key,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.0,
      width: 30,
      decoration: BoxDecoration(
        color: active ? Colors.green : Colors.black.withOpacity(0.1),
        border: Border.all(
          color: active ? Colors.green : Colors.black.withOpacity(0.18),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
