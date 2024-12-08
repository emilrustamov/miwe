import 'package:flutter/material.dart';
import 'package:hackaton/core/assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Dashboards", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            trailing: Row(mainAxisSize: MainAxisSize.min,
              children: [
                Text('Все',style: TextStyle(fontSize: 18),),
                Icon(Icons.arrow_forward_ios, size: 18,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),child: Column(children: [
                Image.asset(CoreAssets.pie, width: 100, height: 100,),
                Text("Cбор за год", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ],),)),
              SizedBox(width: 20),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),child: Column(children: [
                Image.asset(CoreAssets.pie, width: 100, height: 100,),
                Text("Cбор за год", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ],),))
            ],
            ),
          )
        ],
      ),
    );
  }
}