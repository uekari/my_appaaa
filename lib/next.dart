import 'package:flutter/material.dart';
import 'package:my_app/next2.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("次の画面！"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://2.bp.blogspot.com/-m3T2WWjhH4M/WvQG1mVq94I/AAAAAAABL2I/pF1wvl0POMYFZBdNo4ATLciCVStZbJZjwCLcBGAs/s800/animal_angora_usagi.png"),
            Text(
              "あやかり隊",
              // 文字のスタイル変更
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
              ),
            ),
            Text("目指せ優勝！"),
            Row(
              // ボタンを２つ横並びにする
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("次へ"),
                  onPressed: () async {
                    // ボタンを押した時に呼ばれるコードを書く
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage2("ありがとう！！！"),
                      ),
                    );
                  },
                ),
                ElevatedButton(child: const Text("戻る"), onPressed: () {}),
              ],
            ),
            const Text("アンゴラうさぎ"),
          ],
        ),
      ),
    );
  }
}
