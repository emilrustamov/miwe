import 'package:flutter/material.dart';
import 'package:hackaton/screens/agronom.dart';
import 'package:hackaton/widgets/primaryBtn.dart';
import 'package:hackaton/core/assets.dart';
import 'package:hackaton/screens/onePlant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _loginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

bool isVisible = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SvgPicture.asset("assets/miwe.svg"),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    CoreAssets.icon,
                    width: 216,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Login",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      suffixIcon: const Icon(Icons.person)),
                  controller: _loginController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: !isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                    controller: _passwordController,
                  ),
                ),
              ],
            ),
            PrimaryBtn(
              text: "Войти",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AgronomScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
