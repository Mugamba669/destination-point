import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Back extends StatelessWidget {
  Widget child;
  final AnimationController animation;
  final Color? background;
  Back(
      {Key? key,
      required this.child,
      this.background = Colors.indigo,
      required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Transform.rotate(
                origin: Offset(150, -80),
                angle: 0,
                child: Container(
                  width: 400,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(color: background),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
