import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction action;
  final TextInputType type;
  final Widget? suffix;
  final Color errorColor;
  final Function(String)? validation;
  final Function(String)? onChanged;
  final maxLines, minLines;

  const CustomTextFormField(
    this.hint, {
    required this.controller,
    this.obscureText = false,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
    this.errorColor = Colors.white,
    this.validation,
    this.suffix,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'form-$hint',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: type,
          controller: controller,
          textInputAction: action,
          obscureText: obscureText,
          cursorColor: Colors.blue,
          onChanged: onChanged ?? onChanged,
          validator: (val) {
            var title = hint.split(" ")[0];

            if (title == '0') {
              if (val! == '0') {
                return '*required';
              }
            } else {
              if (val!.length < 2) {
                return '$title must > 2 character';
              }
            }
            return null;
          },
          decoration: InputDecoration(
            isDense: suffix != null ? true : false,
            errorStyle: TextStyle(
              color: errorColor,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: suffix ?? suffix,
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 2,
            ),
            focusedBorder: defaultBorder(
              Colors.blue,
            ),
            border: defaultBorder(
              Colors.blue,
            ),
            errorBorder: defaultBorder(
              Colors.red,
            ),
            enabledBorder: defaultBorder(
              Colors.blue.withOpacity(.3),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder defaultBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
