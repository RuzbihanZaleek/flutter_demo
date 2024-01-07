import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //remove debug badge
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("App Bar", style: TextStyle(color: Colors.white)),
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
        body: Container(
          color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Text 1', style: TextStyle(fontSize: 20.0)),
              Text('Text 2', style: TextStyle(fontSize: 20.0)),
              Text('Text 3', style: TextStyle(fontSize: 20.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Text 4', style: TextStyle(fontSize: 20.0)),
                  Text('Text 5', style: TextStyle(fontSize: 20.0)),
                  Text('Text 6', style: TextStyle(fontSize: 20.0)),
                  Text('Button clicked $count times',
                      style: TextStyle(fontSize: 20.0)),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("App Bar", style: TextStyle(color: Colors.white)),
//           leading: IconButton(
//             icon: const Icon(Icons.menu, color: Colors.white),
//             onPressed: () {},
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.search,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.more_vert,
//                 color: Colors.white,
//               ),
//             )
//           ],
//           flexibleSpace: Image.asset(
//             "assets/back.jpg", // displays in a small area without fit
//             fit: BoxFit.cover, // cover full app bar space
//           ),
//           // bottom: const TabBar(
//           //   tabs: [
//           //     Tab(icon: Icon(Icons.directions_car, color: Colors.white)),
//           //     Tab(icon: Icon(Icons.directions_train, color: Colors.white)),
//           //     Tab(icon: Icon(Icons.directions_bike, color: Colors.white))
//           //   ],
//           // ),
//           backgroundColor:
//               Colors.blue, //flexible space will override background color
//         ),
//         body: Container(
//           color: Colors.pink,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Text 1', style: TextStyle(fontSize: 20.0)),
//               Text('Text 2', style: TextStyle(fontSize: 20.0)),
//               Text('Text 3', style: TextStyle(fontSize: 20.0)),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Text 4', style: TextStyle(fontSize: 20.0)),
//                   Text('Text 5', style: TextStyle(fontSize: 20.0)),
//                   Text('Text 6', style: TextStyle(fontSize: 20.0)),
//                   Text('Button clicked 0 times', style: TextStyle(fontSize: 20.0)),
//                 ],
//               )
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

// Widget tabBody(String? bodyText, IconData icon) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text("$bodyText", style: const TextStyle(fontSize: 35.0)),
//       Icon(icon)
//     ],
//   );
// }
