import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class CustomInputField extends StatelessWidget {
   CustomInputField({
    required this.inputController,
    required this.keyboard,
    required this.hintText,
    required this.validator,
  });

  final TextEditingController inputController;
  final String hintText;
  final TextInputType keyboard;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: keyboard,
      decoration: InputDecoration(
        fillColor: Palette.primaryTextColor3,
        filled: true,
        hintText: hintText,
        contentPadding: EdgeInsets.only(left: getProportionateScreenWidth(14)),
        focusColor: Palette.primaryTextColor4,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      validator: validator
    );
  }
}
