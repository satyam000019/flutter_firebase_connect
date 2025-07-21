import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/home_page.dart';

class SignupPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signup(BuildContext context) async {
    try {
      print("Trying to sign up...");
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print("Signup successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } catch (e) {
      print("Signup error: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => signup(context), child: Text("Signup")),
          ],
        ),
      ),
    );
  }
}
