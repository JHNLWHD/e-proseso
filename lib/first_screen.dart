import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'process.dart';
import 'process_screen.dart';
import 'sign_in.dart';

class FirstScreen extends StatefulWidget {

  @override
  _FirstScreenNoteState createState() => new _FirstScreenNoteState();
}

final notesReference = FirebaseDatabase.instance.reference().child(uuid);

class _FirstScreenNoteState extends State<FirstScreen> {
  List<Process> items;
  StreamSubscription<Event> _onNoteAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
    _onNoteChangedSubscription = notesReference.onChildChanged.listen(_onNoteUpdated);
  }


  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Proseso',
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-Proseso'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(20.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].referenceNumber}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].transactionType} \n ${items[position].transactionDate}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: Text(
                          '${items[position].amount}',
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                          ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10.0)),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15.0,
                            child: Text(
                              '${position + 1}',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => _navigateToNote(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Process.fromSnapshot(event.snapshot));
    });
  }

  void _onNoteUpdated(Event event) {
    var oldNoteValue = items.singleWhere((note) => note.referenceNumber == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldNoteValue)] = new Process.fromSnapshot(event.snapshot);
    });
  }

  void _navigateToNote(BuildContext context, Process note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProcessScreen(note)),
    );
  }

}