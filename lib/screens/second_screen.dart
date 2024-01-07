import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/home_page.dart';

class SecondScreen extends StatelessWidget {
  String text;

  SecondScreen({super.key, this.text = "Second Screen"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screens"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
        flexibleSpace: Image.asset('assets/back.jpg', fit: BoxFit.cover),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, style: const TextStyle(fontSize: 20.0))],
        ),
      ),
    );
  }
}
