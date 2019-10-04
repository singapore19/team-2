import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/helper/location_service.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatefulWidget {

  final Map data;

  JobDetail(this.data);

  @override
  State<JobDetail> createState() => _JobDetailState(data);
}

class _JobDetailState extends State<JobDetail> {

  final Map data;

  _JobDetailState(this.data);

  @override
  Widget build(BuildContext context) {

    void openMap(String postal) async {
      // var location = await LocationService.getLocation();
      var from = '486036';
      String url = 'https://www.google.com/maps/dir/?api=1&origin=$from&destination=$postal';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('unable to connect');
      }
    }

    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver app", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(data['address']),
            SizedBox(height: 10,),
            Text(data['time']),
            SizedBox(height: 10,),
            Text(data['remark']),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () => openMap(data['postal']),
              child: Text('Open in google map')
            )
          ],
        )
      )
    );
  }
}