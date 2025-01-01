import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../color.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
    // required this.width,
    // required this.height
  }) : super(key: key);
  final String option;
  final Color color;
  // final double width;
  // final double height;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 55,
        child: Center(
          child: AnimatedContainer(
            width: color == correct
                ? screenwidth - 4 - 8 - 50
                : MediaQuery.of(context)
                    .size
                    .width, //nanti modif ini aja biar gampang tp ini dah work
            height: color == correct ? 47 : 55,
            // height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            duration: Duration(milliseconds: 500),
            child: Center(
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: color == correct ? 17 : 22,
                    color:
                        color.red != color.green ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
