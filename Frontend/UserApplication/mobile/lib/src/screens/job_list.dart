import 'package:flutter/material.dart';

class JobList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _JobList();
}

class _JobList extends State<JobList> {
  @override
  Widget build(BuildContext context) {
    final title = 'Submitted Jobs';

    var jsonString = [{"type": "delivery", "addr": "one @ changi", "time": "14:00"}];
    List<Widget> list = [];
    for (int i =  0; i < jsonString.length; i++) {
      list.add(
        new Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide())
          ),
          child: new Column(
            children: <Widget>[
              Text(jsonString[i]['addr']),
              SizedBox(height: 5,),
              Text(jsonString[i]['type']),
              SizedBox(height: 5,),
              Text(jsonString[i]['time'])
            ]
          )
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: list
      ),
    );
  }
}