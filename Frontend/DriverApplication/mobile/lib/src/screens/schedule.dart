 
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'job_detail.dart';

class Schedule extends StatefulWidget {

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule>{
  int cur = 0;
  var destination = { 
    "destination": [
      {
        "postal": "550106",
        "time": "08:30",
        "address": "Serangoon north ave 1",
        "remark": "jlsadflnsalkfdsadf"
      }, 
      {
        "postal": "609731",
        "time": "11:30",
        "address": "Jcube",
        "remark": "jlsadflnsalkfdsadf"
      }, 
      {
        "postal": "819666",
        "time": "14:30",
        "address": "changi airport",
        "remark": "jlsadflnsalkfdsadf"
      }
    ],
    "distance": "70.8"
  };

  @override
  Widget build(BuildContext context) {

    void goToDetails(var destination) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) => JobDetail(destination)
      ));
    }
    
    List destinationList = destination['destination'];
    List<Widget> schedule = [];
    for (int i = cur; i < destinationList.length; i++) {
      Widget widget = new GestureDetector(
        onTap: () => goToDetails(destinationList[i]),
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide())
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(destinationList[i]['address'], style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10,),
                  Text(destinationList[i]['time'], style: TextStyle(fontSize: 20))
                ],
              ),
              IconButton(
                icon: Icon(Icons.done),
                color: Colors.green,
                iconSize: 40,
                onPressed: (){ 
                  if (i == cur) {
                    destinationList.remove(i);
                    setState(() {
                      cur = cur+1;
                    }); 
                  }
                },
              )
            ]
          )
        )
      );
      schedule.add(widget);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver app", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          children: schedule,
        )
      )
    );
  }

}
