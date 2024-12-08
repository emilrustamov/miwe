import 'package:flutter/material.dart';
import 'package:hackaton/core/colors.dart';

class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({required this.text, required this.onTap, super.key});
  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            border: Border.all(color: CoreColors.mainColor),
            borderRadius: BorderRadius.circular(50),
            color: CoreColors.mainColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: CoreColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
