import 'package:admin/models/Cols.dart';
import 'package:admin/screens/Forms/widgets/PopUp.dart';
import 'package:admin/screens/Login/components/back.dart';
import 'package:admin/widgets/Button.dart';
import 'package:admin/widgets/MainView.dart';
import 'package:admin/widgets/TableView.dart';
import 'package:admin/widgets/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> with TickerProviderStateMixin {
  late AnimationController animations;
  @override
  void initState() {
    animations = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400), value: 4);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainView(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      "Dispatch Forms",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(
                        text: "Add",
                        color: Colors.green,
                        press: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetAnimationDuration:
                                      Duration(milliseconds: 500),
                                  insetAnimationCurve: Curves.bounceOut,
                                  child: PopUp(),
                                );
                              });
                        },
                        width: 60,
                        height: 44,
                        radius: 5),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Search()),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TableView(
                      cols: formCols,
                      rows: formRows,
                      buttonNumber: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
