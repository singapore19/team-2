import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Define a custom Form widget.
import 'package:flutter/material.dart';

class Addjob extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Addjob();
}

class _Addjob extends State<Addjob> {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          // 1 from address
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your address (from)'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),

          // 2 from postal code
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your postal code (from)'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),

          // 3 to address
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your address (to)'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),

          // 4 to postal code
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your postal code (to)'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),

          // 5 type
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your type'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),


          // 7 msc volume
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your volume'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),

          // 8 msc number
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your number'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),


          // 9 msc time
          TextFormField(
            decoration: InputDecoration(
            labelText: 'Enter your time (optional)'
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        


          RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }

            //submit to backend
          },
          child: Text('Submit'),
        ),
         
        ],
      ),
    );
  }
}
