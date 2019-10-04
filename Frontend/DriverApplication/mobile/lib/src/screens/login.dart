
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/screens/schedule.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Drivers Login Page',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _driverIDFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _driverID = "";
  String _password = "";

  _LoginPageState() {
    _driverIDFilter.addListener(_driverIDlisten);
    _passwordFilter.addListener(_passwordListen);
  }

  void _driverIDlisten() {
    if (_driverIDFilter.text.isEmpty) {
      _driverID = "";
    } else {
      _driverID = _driverIDFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Drivers' Login "),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _driverIDFilter,
              decoration: new InputDecoration(
                  labelText: 'Driver ID'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
     return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: () => _loginPressed(context),
            ),
          ],
        ),
      );
  }

  // These functions can self contain any user auth logic required, they all have access to _driverID and _password

  void _loginPressed (BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => Schedule()));
  }
}