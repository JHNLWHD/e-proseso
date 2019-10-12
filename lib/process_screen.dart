import 'package:flutter/material.dart';

import 'process.dart';

class ProcessScreen extends StatefulWidget {
  final Process process;
  ProcessScreen(this.process);

  @override
  State<StatefulWidget> createState() => new _ProcessScreenState();
}


class _ProcessScreenState extends State<ProcessScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Proseso')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Reference Number: ' + widget.process.referenceNumber,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Office: ' + widget.process.nameOfOffice,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Office Address: ' + widget.process.officeAddress,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Client: ' + widget.process.clientName,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Client Address: ' + widget.process.clientAddress,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Transaction: ' + widget.process.transactionType,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Date: ' + widget.process.transactionDate,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Amount: ' + widget.process.amount,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Validity: ' + widget.process.validity,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
          ],
        ),
      ),
    );
  }
}