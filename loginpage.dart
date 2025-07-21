import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignupPage.dart';
import 'ForgotPasswordPage.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
          ElevatedButton(onPressed: () => login(context), child: Text("Login")),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SignupPage()));
          }, child: Text("Signup")),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
          }, child: Text("Forgot Password?")),
        ],
      ),
    );
  }
}
