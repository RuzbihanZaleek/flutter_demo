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

  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = "Controller";

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            keyboardType: TextInputType.text,
            controller: title,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  title.text = '';
                },
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.blueAccent,
              hintText: 'Search...',
              hintStyle: const TextStyle(color: Colors.white70),
            ),
          ),
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
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  maxLength: 8,
                  // obscureText: true, //hide text
                  // enabled: false,
                  // keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 20.0),
                  onChanged: (typing) {
                    print(typing); //printing each type
                  },
                  onSubmitted: (text) {
                    print("Submitted $text"); //printing type after submitted
                  },
                  controller: title,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  maxLength: 8,
                  // obscureText: true, //hide text
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20.0),
                  autofocus: true,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintText: "Hello",
                    icon: Icon(Icons.search),
                    prefixIcon: Icon(Icons.book),
                  ),
                ),
              ),
            ],
          ),
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
