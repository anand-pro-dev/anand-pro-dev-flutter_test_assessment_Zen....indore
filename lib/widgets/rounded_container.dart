import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget roundedHomeContainer(
    {required String name,
    required String email,
    required String image,
    required String lastName}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )),
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(image)),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          lastName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                  ],
                )),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Startdatum",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "01-02-2021",
                            style: TextStyle(
                                // color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            "Einddatum",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "11-02-2021",
                            style: TextStyle(
                                // color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text(
                        "Ok Status",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "IN Order",
                        style: TextStyle(
                            // color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        email,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right_sharp))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

////  Shadow effect for text field...............................................................
Widget shadowContainer({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ), //BoxShadow
        const BoxShadow(
          color: Colors.white,
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ],
    ),
    child: child,
  );
}
