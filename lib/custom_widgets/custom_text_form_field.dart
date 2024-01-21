import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      this.val,
      this.textController,
      this.maxLenght,
      this.keywordtype,
      this.helperText});
  final String title;
  final String? Function(String?)? val;
  final TextEditingController? textController;
  final int? maxLenght;
  final String? helperText;
  final TextInputType? keywordtype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLenght,
      controller: textController,
      decoration: InputDecoration(hintText: title, helperText: helperText),
      validator: val,
      keyboardType: keywordtype,
    );
  }
}