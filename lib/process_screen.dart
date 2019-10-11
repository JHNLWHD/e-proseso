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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Proseso')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(widget.process.referenceNumber),
            Text(widget.process.referenceNumber),
            Text(widget.process.referenceNumber),
            Text(widget.process.referenceNumber),
            Padding(padding: new EdgeInsets.all(5.0)),
          ],
        ),
      ),
    );
  }
}