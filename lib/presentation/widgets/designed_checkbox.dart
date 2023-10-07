import 'package:autom_app/constants.dart';
import 'package:flutter/material.dart';

class DesignedCheckbox extends StatefulWidget {
  const DesignedCheckbox({
    super.key,
    required this.checkedChangedCallback,
  });

  final Function(bool value) checkedChangedCallback;

  @override
  State<DesignedCheckbox> createState() => _DesignedCheckboxState();
}

class _DesignedCheckboxState extends State<DesignedCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Checkbox(
        checkColor: Colors.white,
        activeColor: kRedColor,
        side: isChecked
            ? BorderSide.none
            : const BorderSide(
                color: kActiveColor,
                width: 1,
              ),
        value: isChecked,
        onChanged: (bool? value) {
          if (value != null) {
            widget.checkedChangedCallback(value);
            setState(() {
              isChecked = value;
            });
          }
        },
      ),
    );
  }
}
