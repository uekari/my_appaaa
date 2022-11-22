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
import 'package:flutter/services.dart';
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
          //ここに項目を追加。「no.Text」を「text」にするとテキストを表示できる
          const RouletteUnit.text("うさgi"),
          const RouletteUnit.noText(color: Color.fromARGB(255, 131, 227, 134)),
          const RouletteUnit.noText(color: Color.fromARGB(255, 132, 195, 247)),
          const RouletteUnit.noText(color: Color.fromARGB(255, 237, 162, 43)),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: Column(children: [
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.amber,
                    filled: true,
                    border: InputBorder.none),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 230, 90, 197),
                    filled: true,
                    border: InputBorder.none),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 77, 187, 209),
                    filled: true,
                    border: InputBorder.none),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 177, 235, 116),
                    filled: true,
                    border: InputBorder.none),
              ),
            ]),
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  // ),
                  // 上に重ねる矢印の位置とデザイン
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        width: 260,
                        height: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
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
                        size: 40,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: Shortcuts(
//           shortcuts: const <ShortcutActivator, Intent>{
//             // Pressing space in the field will now move to the next field.
//             SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
//           },
//           child: FocusTraversalGroup(
//             child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               onChanged: () {
//                 Form.of(primaryFocus!.context!)!.save();
//               },
//               child: Wrap(
//                 children: List<Widget>.generate(5, (int index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints.tight(const Size(200, 50)),
//                       child: TextFormField(
//                         onSaved: (String? value) {
//                           debugPrint(
//                               'Value for field $index saved as "$value"');
//                         },
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
