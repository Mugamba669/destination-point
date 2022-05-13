import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Widget child;
  final AnimationController animation;
  Body({Key? key, required this.child, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Transform.translate(
                offset: Offset(0, -390),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Colors.indigo[400]),
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
