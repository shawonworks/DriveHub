import 'package:flutter/material.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/log_print.dart';

class CustomCheckBoxButton extends StatefulWidget {
  const CustomCheckBoxButton({super.key, this.value, required this.onChange, this.color});
  final Function(bool value) onChange;
  final bool? value;
  final Color? color;
  @override
  State<CustomCheckBoxButton> createState() => _CustomCheckBoxButtonState();
}

class _CustomCheckBoxButtonState extends State<CustomCheckBoxButton> {
  bool isValue = false;
  void setFunction() {
    try {
      isValue = widget.value ?? false;
    } catch (e) {
      errorLog("setFunction", e);
    }
  }

  void onAppChange(CustomCheckBoxButton oldWidget) {
    try {
      if (oldWidget.value != widget.value) {
        setState(() {
          isValue = widget.value ?? false;
        });
      }
    } catch (e) {
      errorLog('onAppChange', e);
    }
  }

  @override
  void initState() {
    super.initState();
    setFunction();
  }

  @override
  void didUpdateWidget(covariant CustomCheckBoxButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    onAppChange(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xff009E99)),
        child: Checkbox(
          activeColor: Colors.white,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return BorderSide(color: isValue ? widget.color ?? Color(0xff009E99) : Colors.white70);
            } else {
              return BorderSide(color: Colors.grey);
            }
          }),
          value: isValue,
          checkColor: widget.color ?? Color(0xff009E99),
          fillColor: WidgetStatePropertyAll(Colors.white70),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: widget.color ?? Color(0xff009E99)),
            borderRadius: BorderRadius.circular(AppSize.width(value: 5.0)),
          ),
          onChanged: (value) {
            setState(() {
              isValue = !isValue;
            });
            widget.onChange(isValue);
          },
        ),
      ),
    );
  }
}
