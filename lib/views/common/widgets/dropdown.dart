import 'package:flutter/material.dart';
import 'package:projectify/core/constants/pallets.dart';

// ignore: must_be_immutable
class CommonDropDown extends StatelessWidget {
  CommonDropDown({
    super.key,
    required this.onChanged,
    required this.items,
    required this.hintText,
    required this.validator,
    required this.label,
    this.value,
    this.bgColor,
  });

  void Function(String?)? onChanged;
  List<DropdownMenuItem<String>>? items;
  String hintText;
  String? Function(String?)? validator;
  Widget label;
  String? value;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: bgColor ?? Pallets.textFieldBgColor,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Pallets.primaryColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Pallets.primaryColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Pallets.primaryColor,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Pallets.primaryColor,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 17,
              horizontal: 10,
            ),
          ),
          onChanged: onChanged,
          value: value,
          hint: Text(hintText),
          items: items,
          validator: validator,
          isDense: true,
          isExpanded: true,
        ),
      ],
    );
  }
}
