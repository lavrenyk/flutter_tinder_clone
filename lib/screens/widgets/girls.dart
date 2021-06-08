import 'package:flutter/material.dart';
import 'package:tinder_clone/theme/colors.dart';

class Girls extends StatelessWidget {
  final Size size;
  final String image;
  final String name;
  final String age;
  final List likes;

  const Girls({
    Key? key,
    required this.size,
    required this.image,
    required this.name,
    required this.age,
    required this.likes,
  }) : super(key: key);

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    black.withOpacity(0.3),
                    black.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: size.width * 0.72,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      color: white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    age,
                                    style: const TextStyle(
                                      color: white,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      color: green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Recently active",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children:
                                    List.generate(likes.length, (indexLikes) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    decoration: BoxDecoration(
                                        color: indexLikes == 0
                                            ? white.withOpacity(0.4)
                                            : white.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: indexLikes == 0
                                            ? Border.all(
                                                color: white,
                                                width: 2,
                                              )
                                            : null),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 3.0,
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        likes[indexLikes],
                                        style: const TextStyle(
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Icon(
                              Icons.info,
                              color: white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
