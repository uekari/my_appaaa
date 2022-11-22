// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:my_app/next4.dart';
// import 'dart:async';

// class NextPage3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("次の画面！"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
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
//                       MaterialPageRoute(builder: (context) => NextPage4()),
//                     );
//                   },
//                 ),
//                 ElevatedButton(child: const Text("戻る"), onPressed: () {}),
//               ],
//             ),
//             const Text("ほい！！"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ↓ ルーレット作成

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:roulette/roulette.dart';

class NextPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late RouletteController _controller;
  bool _clockwise = true;

  @override
  void initState() {
    _controller = RouletteController(
        group: RouletteGroup([
          const RouletteUnit.noText(color: Colors.red),
          const RouletteUnit.noText(color: Colors.green),
          const RouletteUnit.noText(color: Colors.blue),
          const RouletteUnit.noText(color: Colors.yellow),
        ]),
        vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ルーレット'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                // children: [
                //   const Text(
                //     "右回り",
                //     style: TextStyle(fontSize: 18),
                //   ),
                //   Switch(
                //     value: _clockwise,
                //     onChanged: (onChanged) {
                //       setState(() {
                //         _controller.resetAnimation();
                //         _clockwise = !_clockwise;
                //       });
                //     },
                //   ),
                // ],
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: 260,
                    height: 260,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Roulette(
                        controller: _controller,
                        style: const RouletteStyle(
                          dividerThickness: 4,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.longArrowAltDown,
                    size: 45,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.rollTo(
          2,
          clockwise: _clockwise,
          offset: Random().nextDouble(),
        ),
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
