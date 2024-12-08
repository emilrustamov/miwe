import 'package:flutter/material.dart';
import 'package:hackaton/core/assets.dart';
import 'package:hackaton/core/colors.dart';
import 'package:hackaton/screens/dashboard.dart';
import 'package:hackaton/screens/login.dart';
import 'package:hackaton/screens/onePlant.dart';
import 'package:hackaton/screens/taskCreate.dart';

class AgronomTasksScreen extends StatefulWidget {
  const AgronomTasksScreen({super.key});

  @override
  State<AgronomTasksScreen> createState() => _AgronomTasksScreenState();
}

class _AgronomTasksScreenState extends State<AgronomTasksScreen> {
  List<TaskModel> taskList = [
    TaskModel(
        isDone: true,
        name: 'Полив',
        date: '15/04/2025',
        place: 'Участок1',
        sector: 'Сектор A1',
        status: 'Выполнено'),
    TaskModel(
        name: 'Удобрение',
        date: '16/04/2025',
        place: 'Участок3',
        sector: 'Сектор B1',
        status: 'В работе'),
    TaskModel(
        name: 'Обработка',
        date: '17/04/2025',
        place: 'Участок5',
        sector: 'Сектор E1',
        status: 'В работе'),
    TaskModel(
        isDone: true,
        name: 'Полив',
        date: '17/04/2025',
        place: 'Участок5',
        sector: 'Сектор E1',
        status: 'Выполнено'),
    TaskModel(
        name: 'Сбор урожая',
        date: '19/05/2025',
        place: 'Участок6',
        sector: 'Сектор F1',
        status: 'В работе'),
    TaskModel(
        name: 'Полив',
        date: '20/05/2025',
        place: 'Участок5',
        sector: 'Сектор E2',
        status: 'В работе'),
  ];
  final GlobalKey<ScaffoldState> _scaffolKeyAg = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKeyAg,
      backgroundColor: const Color(0xffFEFEFE),
      drawer: Drawer(
        backgroundColor: CoreColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: CoreColors.lightGrey, // Color for the drawer header
              ),
              child: Image.asset(
                CoreAssets.icon,
                scale: 2,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Администратор'),
              onTap: () {
                // Handle navigation or other actions
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DashboardScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Агроном'),
              onTap: () {
                // Handle navigation or other actions
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AgronomTasksScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) =>
                      false, // This removes all previous routes
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu), // Icon for the drawer
                    onPressed: () {
                      _scaffolKeyAg.currentState
                          ?.openDrawer(); // Open drawer on icon press
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OnePlantScreen()));
                      },
                      icon: const Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Color(0xff7F8995),
                        size: 32,
                      ))
                ],
              ),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: [
                for (var i = 0; i < taskList.length; i++)
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2, color: Color(0xffEFE8F7)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(taskList[i].name,
                                  style: const TextStyle(
                                      color: Color(0xff191925),
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text(taskList[i].date,
                                style: const TextStyle(
                                    color: Color(0xff191925), fontSize: 14))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(taskList[i].place,
                                  style: const TextStyle(
                                    color: Color(0xff191925),
                                  )),
                            ),
                            Text(taskList[i].sector,
                                style: const TextStyle(
                                    color: Color(0xff191925), fontSize: 14)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: taskList[i].isDone!
                                  ? const Color(0xff014A3D)
                                  : const Color(0xffEFE8F7),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            taskList[i].status,
                            style: TextStyle(
                                fontSize: 14,
                                color: taskList[i].isDone!
                                    ? const Color(0xffFEFEFE)
                                    : const Color(0xff191925)),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TaskCreateScreen()));
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              color: Color(0xff014A3D), shape: BoxShape.circle),
          child: const Icon(
            Icons.add,
            color: Color(0xffFEFEFE),
            size: 40,
          ),
        ),
      ),
    );
  }
}

class TaskModel {
  TaskModel(
      {this.isDone = false,
      required this.name,
      required this.date,
      required this.place,
      required this.sector,
      required this.status});
  String name;
  String date;
  String place;
  String sector;
  String status;
  bool? isDone;
}
