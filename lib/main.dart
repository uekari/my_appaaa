// import 'package:flutter/material.dart';
// import 'package:my_app/next.dart';
// // import 'package:my_app/nextpage.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const MyHomePage(title: 'あやかり隊'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           Icon(Icons.add),
//           Icon(Icons.share),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Image.network(
//                 "https://2.bp.blogspot.com/-m3T2WWjhH4M/WvQG1mVq94I/AAAAAAABL2I/pF1wvl0POMYFZBdNo4ATLciCVStZbJZjwCLcBGAs/s800/animal_angora_usagi.png"),
//             Row(
//               // ボタンを２つ横並びにする
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   child: const Text("次へ"),
//                   onPressed: () {
//                     // ボタンを押した時に呼ばれるコードを書く
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NextPage()),
//                     );
//                   },
//                 ),
//                 ElevatedButton(child: const Text("戻る"), onPressed: () {}),
//               ],
//             ),
//             const Text("アンゴラうさぎ！！！"),
//           ],
//         ),
//       ),

//       // カウントボタン
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(
//           Icons.favorite,
//           color: Colors.pink,
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// ↑ 元々のmain画面！OKのやつ！

import 'package:flutter/material.dart';
import 'package:my_app/next.dart';
import 'package:my_app/next2.dart';
import 'package:my_app/next3.dart';
import 'package:my_app/next4.dart';
import 'package:my_app/home.dart';

import 'next.dart';
import 'next2.dart';
import 'next3.dart';
import 'next4.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static var _screens = [NextPage(), NextPage3(), NextPage4(), Homepage()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'ルーレット'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled), label: '現在時刻'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'アラーム'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
