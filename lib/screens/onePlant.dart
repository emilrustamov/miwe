import 'package:flutter/material.dart';
import 'package:hackaton/widgets/listTile.dart';
import 'package:hackaton/core/assets.dart';
import 'package:hackaton/core/colors.dart';

class OnePlantScreen extends StatefulWidget {
  const OnePlantScreen({super.key});

  @override
  State<OnePlantScreen> createState() => _OnePlantScreenState();
}

class _OnePlantScreenState extends State<OnePlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColors.white,
      appBar: AppBar(
        backgroundColor: CoreColors.white,
        automaticallyImplyLeading: true,
        leading: Container(
          margin: EdgeInsets.all(8),
          // padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: CoreColors.mainColor,
              borderRadius: BorderRadius.circular(50)),
          // color: CoreColors.black,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: CoreColors.white,
                size: 14,
              )),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Image.asset(
            CoreAssets.apple,
            width: 125,
            height: 90,
          ),
          ListTileOneTree(title: "Вид дерева:", sub: "яблоня"),
          ListTileOneTree(title: "Сорт:", sub: "карликовая"),
          ListTileOneTree(title: "Дата посадки:", sub: "06/10/2022"),
          ListTileOneTree(title: "Возраст:", sub: "20"),
          ListTileOneTree(title: "Участок:", sub: "2"),
          ListTileOneTree(title: "Возраст:", sub: "20"),
          ListTileOneTree(title: "Сектор:", sub: "A3"),
          ListTileOneTree(title: "Дата последнего полива:", sub: "08/12/2024"),
          ListTileOneTree(
              title: "Дата последнего удобрения:", sub: "12/09/2024"),
          ListTileOneTree(
              title: "Дата последнего обработки:", sub: "12/09/2024"),
          ListTileOneTree(title: "Урожайность за 2022:", sub: "230кг"),
          ListTileOneTree(title: "Урожайность за 2023:", sub: "250кг"),
          ListTileOneTree(title: "Урожайность за 2024:", sub: "140кг"),
        ],
      ),
    );
  }
}
