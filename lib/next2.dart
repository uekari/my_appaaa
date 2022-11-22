import 'package:flutter/material.dart';
import 'package:my_app/next3.dart';

class NextPage2 extends StatelessWidget {
  // 前ページで入力した(ありがとう！！！)をnameに代入
  NextPage2(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("3つ目の画面！"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://2.bp.blogspot.com/-m3T2WWjhH4M/WvQG1mVq94I/AAAAAAABL2I/pF1wvl0POMYFZBdNo4ATLciCVStZbJZjwCLcBGAs/s800/animal_angora_usagi.png"),
            // アイコンの表示も可能,サイズも調整可能
            Icon(
              Icons.cached,
              size: 100,
            ),
            Row(
              // ボタンを２つ横並びにする
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 次へボタンを押した時・・・とその処理
                ElevatedButton(
                  child: const Text("次へ"),
                  onPressed: () {
                    // ボタンを押した時に呼ばれるコードを書く
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage3(),
                      ),
                    );
                  },
                ),
                // 戻るボタンを押した時・・・とその処理
                ElevatedButton(
                    child: const Text("戻る"),
                    onPressed: () {
                      // popで前のページに戻れる
                      // 前のページに戻ったら"どういたしまして！！！"を表示させる
                      // どこに・・・？かが分からない
                      Navigator.pop(context, "どういたしまして！！！");
                    }),
              ],
            ),
            const Text("アンゴラうさぎ〜"),
            // 前の画面で入力してるname内(ここでは”ありがとう！！！”)を表示
            Text(name),
          ],
        ),
      ),
    );
  }
}
