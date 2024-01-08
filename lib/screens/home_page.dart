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

  //Items Array
  var items = List<String>.generate(100, (index) => 'Item $index');

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
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return listTileWidget(
                Icons.email, items[index], 'sub ${items[index]}');
          },
        ),
      ),
    );
  }
}

Widget listTileWidget(IconData leadingIcon, String title, String subTitle,
    {bool menu = true}) {
  return ListTile(
    leading: Icon(leadingIcon),
    title: Text(title),
    subtitle: subTitle.isNotEmpty ? Text(subTitle) : null,
    trailing: menu ? const Icon(Icons.menu) : null,
  );
}
