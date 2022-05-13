import 'package:flutter/material.dart';

class PageTransition extends StatelessWidget {
  final AnimationController animation;
  final Widget child;
  double yTranslation;
  PageTransition(
      {Key? key,
      required this.animation,
      this.yTranslation = 50,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, yTranslation * (1.0 - animation.value), 0.0),
              child: child),
        );
      },
    );
  }
}
