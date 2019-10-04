import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/screens/login.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  
  @override
  State<App> createState() => _AppState();

}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    
      home: Scaffold( 
        appBar: AppBar(
          title: Text("Driver app", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: LoginPage()
          )
        )
      );
  }
}