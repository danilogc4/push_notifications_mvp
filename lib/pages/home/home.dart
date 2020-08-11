import 'package:flutter/material.dart';
import 'package:push_mvp/Notification/one_signal.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var notification = NotificationOneSignal();
  String id;

  @override
  void initState() {
    notification.initOneSignal();
    notification.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("FlutterOneSignal"),
        centerTitle: true,
      ),
      body: Center(child: 
        Text("Notificações"))
    );
  }
}