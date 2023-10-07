import 'package:flutter/material.dart';

import '../../constants.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.text,
    required this.onTapCallback,
  });

  final String text;
  final Function onTapCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
          text,
          style: kGreyTextStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        onTap: () {
          onTapCallback();
        });
  }
}
