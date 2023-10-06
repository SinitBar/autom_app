import 'package:flutter/material.dart';

class DesignedCheckbox extends StatefulWidget {
  const DesignedCheckbox({
    super.key,
    required this.checkedChangedCallback,
  });

  final Function checkedChangedCallback;

  @override
  State<DesignedCheckbox> createState() => _DesignedCheckboxState();
}

class _DesignedCheckboxState extends State<DesignedCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    void changeChecked(bool value) {
      setState(() {
        isChecked = value;
      });
      widget.checkedChangedCallback(value);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        if (value != null) {
          changeChecked(value);
        }
      },
    );
  }
}
