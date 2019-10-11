import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'process.dart';

class ProcessScreen extends StatefulWidget {
  final Process process;
  ProcessScreen(this.process);

  @override
  State<StatefulWidget> createState() => new _ProcessScreenState();
}

final processReference = FirebaseDatabase.instance.reference().child('notes');

class _ProcessScreenState extends State<ProcessScreen> {
  TextEditingController _referenceNumberController;

  @override
  void initState() {
    super.initState();

    _referenceNumberController = new TextEditingController(text: widget.process.referenceNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _referenceNumberController,
              decoration: InputDecoration(labelText: 'Reference Number'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.process.referenceNumber != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.process.referenceNumber != null) {
                  processReference.child(widget.process.referenceNumber).set({
                    'referenceNumber': _referenceNumberController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  processReference.push().set({
                    'referenceNumber': _referenceNumberController.text,
                  }).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}