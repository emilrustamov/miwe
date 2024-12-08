import 'package:flutter/material.dart';

class ListTileOneTree extends StatelessWidget {
  ListTileOneTree({required this.title, required this.sub, super.key});
  String title;
  String sub;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
          minTileHeight: 45,
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(sub)],
          ),
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
    );
  }
}
