import 'package:flutter/material.dart';

import 'Button.dart';

// ignore: must_be_immutable
class TableView extends StatelessWidget {
  List<String> cols;
  List rows;
  int buttonNumber;
  TableView(
      {Key? key,
      required this.cols,
      required this.buttonNumber,
      required this.rows})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          columns: List.generate(
            cols.length,
            (index) => DataColumn(
              label: Text(
                cols[index],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          rows: List.generate(
            rows.length,
            (index) => DataRow(
              color: MaterialStateProperty.all(
                  (index % 2 != 0) ? Colors.grey[400] : Colors.grey[100]),
              cells: List.generate(
                rows[index]['fdata'].length,
                (i) => DataCell(
                  i == buttonNumber
                      ? Button(
                          text: "Edit",
                          color: Colors.teal[500],
                          press: () {},
                          width: 80,
                          height: 30,
                          radius: 5)
                      : Text(
                          "${rows[index]['fdata'][i]}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
