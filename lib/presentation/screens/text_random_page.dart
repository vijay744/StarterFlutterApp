import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRandomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextRandomPageState();
  }
}

class _TextRandomPageState extends State<TextRandomPage> {
  String _personName = "Names will start appearing";
  List<String> _names = [
    "Vijay",
    "Akshay",
    "Varad",
    "Santosh",
    "Shubham",
    "John",
    "Rahul",
    "Sachin",
    "Virat",
    "Rohit",
    "Rooney"
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _personName = _names[Random().nextInt(_names.length)];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Text Per 10 Sec"),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            Center(
              child: Text(
                _personName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
