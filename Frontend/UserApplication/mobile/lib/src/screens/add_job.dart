import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/screens/add_job.dart';
import 'dart:convert';
import 'job_list.dart';


class AddJob extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddJobState();
}

class _AddJobState extends State<AddJob> {

  final TextEditingController _StartAddressFilter = new TextEditingController();
  final TextEditingController _StartPostalFilter = new TextEditingController();
  final TextEditingController _DestAddressFilter = new TextEditingController();
  final TextEditingController _DestPostalFilter = new TextEditingController();
  final TextEditingController _TypeFilter = new TextEditingController();
  final TextEditingController _VolumeFilter = new TextEditingController();
  final TextEditingController _NumberPplFilter = new TextEditingController();
  String _startaddress = "";
  String _startpostal = "";
  String _destinationaddress = "";
  String _destinationpostal = "";
  String _type = "";
  String _volume = "";
  String _numberppl = "";


  _SubmitJobState() {
    _StartAddressFilter.addListener(_startaddresslisten);
    _StartPostalFilter.addListener(_startpostallisten);
    _DestAddressFilter.addListener(_destaddressListen);
    _DestPostalFilter.addListener(_destpostalListen);
    _TypeFilter.addListener(_typeListen);
    _VolumeFilter.addListener(_volumeListen);
  }

  void _startaddresslisten() {
    if (_StartAddressFilter.text.isEmpty) {
      _startaddress = "";
    } else {
      _startaddress = _StartAddressFilter.text;
    }
  }

  void _startpostallisten() {
    if (_StartPostalFilter.text.isEmpty) {
      _startpostal = "";
    } else {
      _startpostal = _StartPostalFilter.text;
    }
  }


  void _destaddressListen() {
    if (_DestAddressFilter.text.isEmpty) {
      _destinationaddress = "";
    } else {
      _destinationaddress = _DestAddressFilter.text;
    }
  }

  void _destpostalListen() {
    if (_DestPostalFilter.text.isEmpty) {
      _destinationpostal = "";
    } else {
      _destinationpostal = _DestPostalFilter.text;
    }
  }

  void _typeListen() {
    if (_TypeFilter.text.isEmpty) {
      _type = "";
    } else {
      _type = _TypeFilter.text;
    }
  }

  void _volumeListen() {
    if (_VolumeFilter.text.isEmpty) {
      _volume = "";
    } else {
      _volume = _VolumeFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: _buildBar(context),
      resizeToAvoidBottomPadding: false,
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(context),
          ],
        ),
      )
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Submit a new job"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      height: MediaQuery.of(context).size.height - 186,
      child: new ListView(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _StartAddressFilter,
              decoration: new InputDecoration(
                  labelText: 'Address of starting location'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _StartPostalFilter,
              decoration: new InputDecoration(
                  labelText: 'Postal code of starting location'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _DestAddressFilter,
              decoration: new InputDecoration(
                  labelText: 'Address of destination'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _DestPostalFilter,
              decoration: new InputDecoration(
                  labelText: 'Postal code of destination'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _TypeFilter,
              decoration: new InputDecoration(
                  labelText: 'Type of job'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _VolumeFilter,
              decoration: new InputDecoration(
                  labelText: 'Volume of object for delivery'
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Submit job'),
            onPressed: () => _submitPressed(context),
          ),
          new RaisedButton(
            child: new Text('View all jobs'),
            onPressed: () => _viewAllPressed(context),
          ),
        ],
      ),
    );
  }

  void _viewAllPressed (BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => JobList()));
  }

  void _submitPressed (BuildContext context) {
    var data_to_back = {
      "user": { "userID": "3", "usename": "James", "role": "1"},
      'starting': {'address': _startaddress, "postal": _startpostal},
      'destination': {
        'address': _destinationaddress,
        "postal": _destinationpostal
      },
      'type': _type,
      'msc': {
        "volume": _volume,
        "number": _numberppl,
        "time": {"start": "10:00"}
      }
    };
    var jsonData = jsonEncode(data_to_back);
    print(jsonData);
  }
}
