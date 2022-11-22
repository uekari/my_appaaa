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
import 'package:google_fonts/google_fonts.dart';

import 'package:roulette/roulette.dart';

class NextPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette',
      theme: ThemeData(
        primarySwatch: Colors.orange,
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
          //ここに項目を追加。「noText」を「text」にするとテキストを表示できる
          const RouletteUnit.noText(color: Colors.pink),
          const RouletteUnit.noText(color: Color.fromARGB(255, 78, 192, 245)),
          const RouletteUnit.noText(color: Color.fromARGB(255, 247, 153, 38)),
          const RouletteUnit.noText(color: Color.fromARGB(255, 130, 219, 63)),
          const RouletteUnit.noText(color: Color.fromARGB(255, 245, 241, 7)),
        ]),
        vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Roulette",
          style: GoogleFonts.nanumPenScript(
            color: Color.fromARGB(255, 249, 249, 250),
            fontSize: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
          ),
          Text("順番を決めよう"),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 90,
                  right: 90,
                  bottom: 50,
                ),
                child: Column(children: [
                  SizedBox(height: 1),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      hintText: "name",
                      // fillColor: Colors.amber,
                      // filled: true,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 78, 192, 245),
                      ),
                      hintText: "name",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 247, 153, 38),
                      ),
                      hintText: "name",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 130, 219, 63),
                      ),
                      hintText: "name",
                    ),
                  ),
                ]),
              ),
            ],
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
                        width: 250,
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Roulette(
                            controller: _controller,
                            style: const RouletteStyle(
                              dividerThickness: 2,
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
        child: const Icon(
          Icons.refresh_rounded,
          color: Colors.white,
        ),
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
