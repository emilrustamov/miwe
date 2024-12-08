import 'package:flutter/material.dart';
import 'package:hackaton/core/colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColors.white,
      appBar: AppBar(
        backgroundColor: CoreColors.white,
        title: Text("История"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 5; i++)
            ListTile(
              isThreeLine: true,
              dense: true,
              title: Text(
                "Полив",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("15/04/2025\nУчасток 1 Сектор А1"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: i % 2 == 0 ? Color(0xFF084c3c) : null,
                        foregroundColor: i % 2 == 0 ? Colors.white : null,
                      ),
                      onPressed: () {},
                      child: Text(i % 2 == 0 ? "Выполнено" : "В процессе")),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
