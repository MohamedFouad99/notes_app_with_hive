import 'package:flutter/material.dart';
import '../constant/constant.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChange});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChange,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Filed is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
