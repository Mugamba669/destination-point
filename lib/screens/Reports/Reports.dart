import 'package:admin/constants.dart';
import 'package:admin/models/Cols.dart';
import 'package:admin/screens/Reports/widget/Pop.dart';
import 'package:admin/widgets/Button.dart';
import 'package:admin/widgets/MainView.dart';
import 'package:admin/widgets/Space.dart';
import 'package:admin/widgets/TableView.dart';
import 'package:admin/widgets/search/search.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return MainView(
        content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reports",
                    style: labelText,
                  ),
                  Button(
                      text: "Print",
                      press: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: RPopUp(),
                              );
                            });
                      },
                      width: 90,
                      height: 40,
                      radius: 5)
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.86,
                child: Search(),
              ),
            ),
            Space(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TableView(
                    cols: repoCols,
                    rows: reportRows,
                    buttonNumber: 7,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      text: "Previous",
                      press: () {},
                      width: 100,
                      height: 40,
                      radius: 5),
                  Button(
                      text: "Next",
                      outline: true,
                      color: Colors.grey[700],
                      press: () {},
                      width: 80,
                      height: 30,
                      radius: 5)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
