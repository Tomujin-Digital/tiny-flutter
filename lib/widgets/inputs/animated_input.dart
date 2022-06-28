import 'package:flutter/material.dart';

class AnimatedInput extends StatelessWidget {
  const AnimatedInput({
    Key? key,
    this.label,
    this.errorColor,
    this.errorMessage,
    required this.onValidator,
    required this.controller,
  }) : super(key: key);
  final String? label;
  final Color? errorColor;
  final String? errorMessage;
  final TextEditingController controller;
  final Function(String? validatorValue) onValidator;

  @override
  Widget build(BuildContext context) {
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
        controller: controller,
        validator: (value) => onValidator(value),
      ),
    );
  }
}
