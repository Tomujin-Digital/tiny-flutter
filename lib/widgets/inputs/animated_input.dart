import 'package:flutter/material.dart';

import '../../app/utils/de_bouncer.dart';

class AnimatedInput extends StatelessWidget {
  const AnimatedInput({
    Key? key,
    this.label,
    this.errorColor,
    this.errorMessage,
    this.hasDebouncer = false,
    this.function,
    required this.onValidator,
    required this.controller,
  }) : super(key: key);
  final String? label;
  final Color? errorColor;
  final String? errorMessage;
  final TextEditingController controller;
  final bool hasDebouncer;
  final Function(String? validatorValue) onValidator;
  final Function(String? query)? function;

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: hasDebouncer ? 500 : 0);
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      alignment: Alignment.topCenter,
      child: TextFormField(
        // todo input decoration
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          errorStyle: TextStyle(
            color: errorColor ?? Colors.red,
            fontSize: 16.0,
          ),
        ),
        onChanged: (value) {
          _debouncer.run(() {
            if (function != null) {
              function!(value);
            }
          });
        },
        controller: controller,
        validator: (value) => onValidator(value),
      ),
    );
  }
}
