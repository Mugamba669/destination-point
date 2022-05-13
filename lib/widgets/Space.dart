import 'package:flutter/widgets.dart';

class Space extends StatelessWidget {
  double? space;
  Space({Key? key, this.space = 0.03}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * space!,
      width: MediaQuery.of(context).size.width * space!,
    );
  }
}
