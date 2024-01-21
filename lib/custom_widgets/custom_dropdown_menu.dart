import 'dart:developer';

import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({super.key, this.items, required this.dropDownVal});

  final List<Map<T, String>?>? items;

  final T dropDownVal;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      T dropDownValue = this.dropDownVal;

      return DropdownButtonHideUnderline(
          child: DropdownButton(
              items: items
                  ?.map((e) => DropdownMenuItem<T>(
                        value: e?.keys.first,
                        child: Text(e?.values.first ?? ""),
                      ))
                  .toList(),
              onChanged: (T? value) {
                if (value == null) {
                  return;
                }
                log(dropDownValue.toString());
                dropDownValue = value;
                setState(() {});
              }));
    }));
  }
}
