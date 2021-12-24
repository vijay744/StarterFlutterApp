import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextAnimationPageState();
  }
}

class _TextAnimationPageState extends State<TextAnimationPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  final double staticWidth = 100;

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
        child: LayoutBuilder(builder: (ctx, constraints) {
          final Size biggest = constraints.biggest;

          return Stack(
            children: [
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                      Rect.fromLTWH(constraints.maxWidth / 2 - staticWidth / 2,
                          staticWidth, staticWidth, staticWidth),
                      biggest),
                  end: RelativeRect.fromSize(
                      Rect.fromLTWH(
                          (constraints.maxWidth / 2 - staticWidth / 2),
                          constraints.maxHeight - staticWidth,
                          staticWidth,
                          staticWidth),
                      biggest),
                ).animate(CurvedAnimation(
                  parent: _controller1,
                  curve: Curves.elasticInOut,
                )),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: const Text(
                    "SAMPLE TEXT",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        }),
      )),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }
}
