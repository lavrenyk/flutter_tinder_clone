import 'dart:ffi';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<bool> _selected = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 5.0,
          ),
          child: Center(
            child: Text(
              'Работник склада',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "подработка".toUpperCase(),
              style: const TextStyle(fontSize: 12.0),
            ),
            const SizedBox(width: 10.0),
            const Text(
              "•",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(width: 10.0),
            Text(
              "на территории".toUpperCase(),
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        const SizedBox(height: 3.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "1 000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.green,
              ),
            ),
            const Text(
              " ₽",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black38,
              ),
            ),
            const Text(" / смена"),
          ],
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    // width: 40.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.1),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/demo_map.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Container(
                      padding: const EdgeInsets.only(
                        right: 10.0,
                        top: 3.0,
                        bottom: 3.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.white,
                              size: 15.0,
                            ),
                          ),
                          const Text(
                            "Большая Черкизовская 5, стр.1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              JobInfoSelector(selected: _selected),
            ],
          ),
        ),
      ],
    );
  }
}

class JobInfoSelector extends StatefulWidget {
  const JobInfoSelector({
    Key? key,
    required List<bool> selected,
  }) : super(key: key);

  @override
  State<JobInfoSelector> createState() => _JobInfoSelectorState();
}

class _JobInfoSelectorState extends State<JobInfoSelector> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        height: 35,
        padding: const EdgeInsets.all(1.5),
        // width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _activeIndex = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        _activeIndex == 0 ? Colors.white : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Описание",
                    style: TextStyle(
                      color: _activeIndex == 0 ? Colors.black54 : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: _activeIndex == 2 ? Colors.white : Colors.transparent,
                width: 1,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _activeIndex = 1;
                  });
                },
                child: Container(
                  color: _activeIndex == 1 ? Colors.white : Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    "О компании",
                    style: TextStyle(
                        color:
                            _activeIndex == 1 ? Colors.black54 : Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: _activeIndex == 0 ? Colors.white : Colors.transparent,
                width: 1,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _activeIndex = 2;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        _activeIndex == 2 ? Colors.white : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  // color: _activeIndex == 2 ? Colors.white : Colors.transparent,
                  child: Text(
                    "Отзывы",
                    style: TextStyle(
                      color: _activeIndex == 2 ? Colors.black54 : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
