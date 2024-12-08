import 'package:flutter/material.dart';
import 'package:hackaton/core/colors.dart';

class CheckContainer extends StatelessWidget {
  CheckContainer(
      {required this.value,
      required this.onChanged,
      required this.text,
      super.key});
  bool? value;
  Function(bool?) onChanged;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 110,
      decoration: BoxDecoration(
          color: CoreColors.blue, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                visualDensity: VisualDensity.compact,
                checkColor: CoreColors.blue,
                fillColor: WidgetStatePropertyAll(CoreColors.lightGrey),
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 0, bottom: 20),
            child: Text(
              text,
              style: TextStyle(
                  color: CoreColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
