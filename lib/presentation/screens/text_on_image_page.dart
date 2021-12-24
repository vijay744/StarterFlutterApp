import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextOnImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextOnImagePageState();
  }
}

class _TextOnImagePageState extends State<TextOnImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text On Image"),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/images/music_artwork.PNG",
                  fit: BoxFit.cover,
                )),
            Center(
              child: Text(
                "SAMPLE TEXT AT THE IMAGE",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      )),
    );
  }
}
