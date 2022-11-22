import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

// 参考サイト
// https://qiita.com/ywand/items/9df5cc894bae594d5181

class NextPage4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TimerState();
  }
}

class _TimerState extends State<NextPage4> {
  String _nowtime = '';
  var formatter = DateFormat(
    'yyyy年MM月dd日\n' + 'HH時mm分ss秒',
  );
  var _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      // 定期実行する間隔の設定.
      Duration(milliseconds: 100),
      // 定期実行関数.
      _onTimer,
    );
  }

  @override
  void dispose() {
    // 破棄される時に停止する.
    _timer.cancel();
    super.dispose();
  }

  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var formatterTime = formatter.format(now);
    setState(() {
      _nowtime = formatterTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                '現在時刻：\n' + _nowtime,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ↑ 現在時刻表示OK

// ↓ ルーレット作成

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:roulette/roulette.dart';

// class NextPage4 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Roulette',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late RouletteController _controller;
//   bool _clockwise = true;

//   @override
//   void initState() {
//     _controller = RouletteController(
//         group: RouletteGroup([
//           const RouletteUnit.noText(color: Colors.red),
//           const RouletteUnit.noText(color: Colors.green),
//           const RouletteUnit.noText(color: Colors.blue),
//           const RouletteUnit.noText(color: Colors.yellow),
//         ]),
//         vsync: this);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ルーレット'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 // children: [
//                 //   const Text(
//                 //     "右回り",
//                 //     style: TextStyle(fontSize: 18),
//                 //   ),
//                 //   Switch(
//                 //     value: _clockwise,
//                 //     onChanged: (onChanged) {
//                 //       setState(() {
//                 //         _controller.resetAnimation();
//                 //         _clockwise = !_clockwise;
//                 //       });
//                 //     },
//                 //   ),
//                 // ],
//               ),
//               Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   SizedBox(
//                     width: 260,
//                     height: 260,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 30),
//                       child: Roulette(
//                         controller: _controller,
//                         style: const RouletteStyle(
//                           dividerThickness: 4,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Icon(
//                     FontAwesomeIcons.longArrowAltDown,
//                     size: 45,
//                     color: Colors.black,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _controller.rollTo(
//           2,
//           clockwise: _clockwise,
//           offset: Random().nextDouble(),
//         ),
//         child: const Icon(Icons.refresh_rounded),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
