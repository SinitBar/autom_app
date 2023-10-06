import 'package:flutter/material.dart';

import '../constants.dart';

class DesignedTextField extends StatelessWidget {
  const DesignedTextField({
    super.key,
    required this.labelText,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixStyle: kTextStyle.copyWith(fontSize: 16),
        labelText: labelText,
        labelStyle: kTextStyle.copyWith(
          color: kActiveColor,
          fontSize: 12,
        ),
        constraints: BoxConstraints(maxWidth: kRowWidth),
        border: OutlineInputBorder(),
      ),
    );
  }
}
