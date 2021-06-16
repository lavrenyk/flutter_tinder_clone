import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<bool> _bookmarked = [false];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              onPressed: (_) {
                setState(() {
                  _bookmarked[0] = !_bookmarked[0];
                });
              },
              children: [
                _bookmarked[0]
                    ? const Icon(
                        Icons.bookmark_add,
                        size: 30,
                      )
                    : const Icon(
                        Icons.bookmark_add_outlined,
                        size: 30,
                      ),
              ],
              isSelected: _bookmarked,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: MaterialButton(
                height: 45,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
                child: const Text(
                  "Откликнуться",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                color: Colors.green[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}
