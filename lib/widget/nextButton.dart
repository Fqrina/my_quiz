import 'package:flutter/material.dart';

import '../color.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              color: neutral, borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Text("Next Question",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                )),
          ),
        ),
      ),
    );
  }
}
