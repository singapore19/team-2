import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/screens/add_job.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'User Login Page',
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

  final TextEditingController _userIDFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _userID = "";
  String _password = "";

  _LoginPageState() {
    _userIDFilter.addListener(_userIDlisten);
    _passwordFilter.addListener(_passwordListen);
  }

  void _userIDlisten() {
    if (_userIDFilter.text.isEmpty) {
      _userID = "";
    } else {
      _userID = _userIDFilter.text;
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
      title: new Text("User Login"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _userIDFilter,
              decoration: new InputDecoration(
                  labelText: 'User ID'
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

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed (BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => Addjob()));
  }
}