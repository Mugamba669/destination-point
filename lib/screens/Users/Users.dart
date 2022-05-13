import 'package:admin/constants.dart';
import 'package:admin/models/Cols.dart';
import 'package:admin/screens/Users/widget/Upop.dart';
import 'package:admin/widgets/Button.dart';
import 'package:admin/widgets/MainView.dart';
import 'package:admin/widgets/TableView.dart';
import 'package:admin/widgets/search/search.dart';
import 'package:flutter/material.dart';

import '../../widgets/Space.dart';

class Users extends StatefulWidget {
  Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return MainView(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Users",
                  style: labelText,
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        text: "+   Add",
                        press: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: UPop(),
                                );
                              });
                        },
                        width: 80,
                        height: 40,
                        color: Colors.teal[400],
                        radius: 4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Search(),
                    )
                  ],
                ),
              ),
              Space(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TableView(
                      cols: userCols,
                      rows: userRows,
                      buttonNumber: 7,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        text: "Previous",
                        press: () {},
                        width: 100,
                        height: 30,
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
      ),
    );
  }
}
