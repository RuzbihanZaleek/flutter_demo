import 'package:flutter/material.dart';

class NetworkRequest extends StatefulWidget {
  const NetworkRequest({super.key});

  @override
  State<NetworkRequest> createState() => _NetworkRequestState();
}

class _NetworkRequestState extends State<NetworkRequest> {
  //simulate network NetworkRequest
  Future<void> getData() async {
    String email = await Future.delayed(const Duration(seconds: 3), () {
      return "ruzbihan@gmail.com";
    });

    String name = await Future.delayed(const Duration(seconds: 2), () {
      return "ruzbihan";
    });
    print("Name: $name Email: $email");
    print("Data fetched");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asynchronous Programming",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightGreen,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GET DATA", style: TextStyle(fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}
