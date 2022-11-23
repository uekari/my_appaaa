import 'dart:async';
// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/alarm.dart';
import 'package:my_app/add_edit_alarm.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Alarm> AlarmList = [];
  // SlidableController controller = SlidableController();
  Timer? _timer;
  DateTime time = DateTime.now();
  // ローカル通知の変数を定義 インスタンスを作る？
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void notification() {
    flutterLocalNotificationsPlugin.initialize(InitializationSettings(
        android: AndroidInitializationSettings("ic_launcher"),
        // IOSは書き方変わった？
        iOS: DarwinInitializationSettings()));
    flutterLocalNotificationsPlugin.show(
        1,
        "アラーム",
        "時間になりました",
        NotificationDetails(
            android: AndroidNotificationDetails("id", "name",
                importance: Importance.max, priority: Priority.high),
            iOS: DarwinNotificationDetails()));
  }

// 通知を送る（１秒ごと定期的に処理）
  @override
  void initState() {
    super.initState();
    // １秒間に実行
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // timeが１秒ずつ更新される
      time = time.add(Duration(seconds: 1));
      AlarmList.forEach((alarm) {
        if (alarm.isActive == true &&
            alarm.alarmTime.hour == time.hour &&
            alarm.alarmTime.minute == time.minute &&
            time.second == 0) {
          notification();
          // print("時間です");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(166, 193, 238, 1),
              Color.fromRGBO(251, 194, 235, 1),
            ],
                stops: const [
              0.0,
              1.0,
            ])),
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: Color.fromRGBO(166, 193, 238, 0.3),
              largeTitle: Text(
                "リスト!",
                style: TextStyle(color: Colors.white),
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                onTap: () async {
                  // 画面遷移、非同期処理
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEditAlarmPage(AlarmList)));
                  setState(() {
                    AlarmList.sort(
                        ((a, b) => a.alarmTime.compareTo(b.alarmTime)));
                  });
                },
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              Alarm alarm = AlarmList[index];
              return Column(
                children: [
                  Slidable(
                    key: const ValueKey(0),
                    endActionPane:
                        // ignore: prefer_const_constructors
                        ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            children: const [
                          // SlidableAction(
                          //   onPressed: doNothing,
                          //   icon: Icons.delete,
                          //   backgroundColor: Colors.red,
                          //   label: "削除",
                          // ),
                        ]),
                    child: ListTile(
                      title: Text(DateFormat("H:mm").format(alarm.alarmTime),
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                      trailing: CupertinoSwitch(
                        value: alarm.isActive,
                        onChanged: (newValue) {
                          setState(() {
                            alarm.isActive = newValue;
                          });
                        },
                      ),
                      onTap: () async {
                        // 非同期処理
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddEditAlarmPage(AlarmList, index: index)));
                        setState(() {
                          AlarmList.sort(
                              ((a, b) => a.alarmTime.compareTo(b.alarmTime)));
                        });
                      },
                    ),
                  )
                ],
              );
            },
                    // アラームリストを何個作るかを設定
                    childCount: AlarmList.length)),
          ],
        ),
      ),
    );
  }
}
