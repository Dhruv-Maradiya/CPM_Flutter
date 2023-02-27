import 'package:flutter/material.dart';
import 'package:projectify/core/constants/pallets.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  String title;
  int? maxLines;
  String? hintText;
  Widget? suffixIcons;
  TextEditingController? controller;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  bool? isObscure;
  bool? isReadOnly;
  void Function()? onTap;
  String? Function(String?)? validator;

  CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.maxLines,
    this.suffixIcons,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.isObscure,
    this.isReadOnly,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: hintText,
            filled: true,
            fillColor: Pallets.textFieldBgColor,
            suffixIcon: suffixIcons,
            focusColor: Pallets.primaryColor,
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          readOnly: isReadOnly ?? false,
          obscureText: isObscure ?? false,
          maxLines: maxLines,
          controller: controller,
          onTap: onTap,
          validator: validator,
        ),
      ],
    );
    ;
  }
}
