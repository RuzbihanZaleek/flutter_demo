import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/second_screen.dart';

class MyHomePage extends StatefulWidget {
  // to access objects parameters in this class from another class we use widget
  // Ex: widget.title
  final String title;

  const MyHomePage({super.key, this.title = "App Bar"});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
      print(count);
    });
  }

  void handlePlusButton() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return SecondScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(widget.title, style: const TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
          flexibleSpace: Image.asset(
            "assets/back.jpg", // displays in a small area without fit
            fit: BoxFit.cover, // cover full app bar space
          ),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.directions_car, color: Colors.white)),
          //     Tab(icon: Icon(Icons.directions_train, color: Colors.white)),
          //     Tab(icon: Icon(Icons.directions_bike, color: Colors.white))
          //   ],
          // ),
          backgroundColor:
              Colors.blue, //flexible space will override background color
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Text 1', style: TextStyle(fontSize: 20.0)),
            const Text('Text 2', style: TextStyle(fontSize: 20.0)),
            const Text('Text 3', style: TextStyle(fontSize: 20.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Text 4', style: TextStyle(fontSize: 20.0)),
                const Text('Text 5', style: TextStyle(fontSize: 20.0)),
                const Text('Text 6', style: TextStyle(fontSize: 20.0)),
                Text('Button clicked $count times',
                    style: const TextStyle(fontSize: 20.0)),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // handlePlusButton();
            Navigator.of(context).pushNamed('/second');
          },
          tooltip: "Go to next page",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
