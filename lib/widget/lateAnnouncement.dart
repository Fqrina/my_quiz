import 'package:flutter/material.dart';

import '../color.dart';

class MyAnnounce extends StatefulWidget {
  const MyAnnounce({super.key});

  @override
  State<MyAnnounce> createState() => _MyAnnounceState();
}

class _MyAnnounceState extends State<MyAnnounce> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: purple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest Announcements",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "<ntar dikasih program check notification terakhir aja>",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
