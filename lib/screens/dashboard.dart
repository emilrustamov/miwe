import 'package:flutter/material.dart';
import 'package:hackaton/core/assets.dart';
import 'package:hackaton/core/colors.dart';
import 'package:hackaton/screens/agronomTasks.dart';
import 'package:hackaton/screens/all_charts.dart';
import 'package:hackaton/screens/history.dart';
import 'package:hackaton/screens/login.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: CoreColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu), // Icon for the drawer
          onPressed: () {
            _scaffoldKey.currentState
                ?.openDrawer(); // Open drawer on icon press
          },
        ),
        backgroundColor: CoreColors.white,
        title: const Text("Главная"),
        centerTitle: true,
      ),
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
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              "Дашборды",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllChartsScreen()));
                },
                child: const Text(
                  "Смотреть",
                  style: TextStyle(color: Colors.blue),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        CoreAssets.pie,
                        width: 100,
                        height: 100,
                      ),
                      const Text(
                        "Cбор за год",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )),
                const SizedBox(width: 20),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        CoreAssets.barchart,
                        width: 100,
                        height: 100,
                      ),
                      const Text(
                        "Cбор за год",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text(
              "Карта",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  "Смотреть",
                  style: TextStyle(color: Colors.blue),
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(CoreAssets.maps, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text(
              "История",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HistoryScreen()));
                },
                child: const Text(
                  "Смотреть",
                  style: TextStyle(color: Colors.blue),
                )),
          ),
          for (var i = 0; i < 5; i++)
            ListTile(
              isThreeLine: true,
              dense: true,
              title: const Text(
                "Полив",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("15/04/2025\nУчасток 1 Сектор А1"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            i % 2 == 0 ? const Color(0xFF084c3c) : null,
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
