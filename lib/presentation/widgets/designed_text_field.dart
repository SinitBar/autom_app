import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants.dart';

class DesignedTextField extends StatefulWidget {
  const DesignedTextField({
    super.key,
    required this.labelText,
    required this.formatter,
    this.isPhone = false,
  });
  final String labelText;
  final MaskTextInputFormatter formatter;
  final bool isPhone;

  @override
  _DesignedTextFieldState createState() => _DesignedTextFieldState();
}

class _DesignedTextFieldState extends State<DesignedTextField> {
  late bool isFocused;
  late final TextEditingController controller;

  void setPhonePrefix() {
    controller.text = '+7 (';
  }

  @override
  void initState() {
    isFocused = false;
    controller = TextEditingController();
    if (widget.isPhone) {
      setPhonePrefix();
    }
    super.initState();
  }

  void changeFocused(bool value) {
    setState(() {
      isFocused = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kRowWidth,
      child: Padding(
        padding: kTextFieldPadding,
        child: TextField(
          controller: controller,
          inputFormatters: [widget.formatter],
          keyboardType: TextInputType.phone,
          onChanged: (String? newValue) {
            if (newValue!.isEmpty && widget.isPhone) {
              setPhonePrefix();
            }
          },
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: kTextStyle.copyWith(
              color: isFocused ? kActiveColor : kInactiveColor,
              fontSize: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: kInactiveColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: kActiveColor,
                width: 2.0,
              ),
            ),
          ),
          cursorColor: kActiveColor,
          onTap: () {
            changeFocused(true);
          },
          onSubmitted: (value) {
            changeFocused(false);
          },
        ),
      ),
    );
  }
}
