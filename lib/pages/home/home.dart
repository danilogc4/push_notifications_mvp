import 'package:flutter/material.dart';
import 'package:push_mvp/pages/home/bloc/bloc_home.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var bloc = BlocHome();
  String id;

  @override
  void initState() {
    bloc.initOneSignal();
    bloc.load();
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
      body: Column(children: <Widget>[
        Text("Notificações")
      ],),
     
    );
  }
}