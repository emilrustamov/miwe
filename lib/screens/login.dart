import 'package:flutter/material.dart';
import 'package:hackaton/core/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _textController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // SvgPicture.asset("assets/miwe.svg"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                "assets/miwe.png",
                width: 216,
              ),
            ),

            TextField(
              decoration: InputDecoration(
                  labelText: "Login",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  suffixIcon: Icon(Icons.person)),
              controller: _textController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility)),
                ),
                controller: _textController,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CoreColors.mainColor)),
            )
          ],
        ),
      ),
    );
  }
}
