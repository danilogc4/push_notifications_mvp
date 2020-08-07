import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;

const periodicRequest = 'periodicRequest';
const url = 'base_url_here';

showNotification(
    String message, FlutterLocalNotificationsPlugin localNotifications) async {
  var android = AndroidNotificationDetails(
      'channelId', 'channelName', 'channelDescription');
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android, iOS);
  await localNotifications.show(0, 'Status atualizado!', '$message', platform,
      payload: '$message');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  await Workmanager.registerPeriodicTask('teste', periodicRequest,
      frequency: Duration(seconds: 10), initialDelay: Duration(seconds: 1));
  runApp(MyApp());
}

void callbackDispatcher() async {
  Workmanager.executeTask((taskName, inputData) async {
    FlutterLocalNotificationsPlugin localNotifications =
        FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android, iOS);
    localNotifications.initialize(initSetttings);

    var resp = await http.get(url, headers: {});
    var map = json.decode(resp.body);
    if (map['status']) {
      showNotification(map['message'], localNotifications);
    }
    print(map['status']);
    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
