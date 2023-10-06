import 'package:flutter/material.dart';

import '../constants.dart';

class DesignedTextButton extends StatelessWidget {
  const DesignedTextButton({
    super.key,
    required this.text,
    required this.onPressCallback,
    this.backgroundColor = kRedColor,
    this.textColor = Colors.white,
  });

  final String text;
  final Function onPressCallback;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressCallback();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        fixedSize: MaterialStateProperty.all(const Size(kRowWidth, 40)),
      ),
      child: Text(
        text,
        style: kTextStyle.copyWith(
          color: textColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
