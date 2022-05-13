import 'package:admin/controllers/Appbar.dart';
import 'package:admin/models/PageTransition.dart';
import 'package:admin/widgets/MainView.dart';
import 'package:flutter/material.dart';

class Receipts extends StatefulWidget {
  Receipts({Key? key}) : super(key: key);

  @override
  State<Receipts> createState() => _ReceiptsState();
}

class _ReceiptsState extends State<Receipts> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1000,
        ),
        value: 7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainView(
        content: Center(
      child: Text("Receipts"),
    ));
  }
}
