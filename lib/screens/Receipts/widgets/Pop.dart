import 'package:admin/constants.dart';
import 'package:admin/widgets/Button.dart';
import 'package:admin/widgets/input.dart';
import 'package:flutter/material.dart';

class ReceiptsPop extends StatefulWidget {
  ReceiptsPop({Key? key}) : super(key: key);

  @override
  State<ReceiptsPop> createState() => _ReceiptsPopState();
}

class _ReceiptsPopState extends State<ReceiptsPop> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final roleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 1.8,
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.all(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            Text("Employee details", style: labelText),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Name",
                style: labelText,
              ),
            ),
            InputField(
                controller: nameController,
                password: false,
                email: false,
                hint: "Enter employee name"),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Phone", style: labelText),
            ),
            InputField(
                controller: phoneController,
                password: false,
                email: false,
                hint: "Enter employee phone"),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Role", style: labelText),
            ),
            InputField(
                controller: roleController,
                password: false,
                email: false,
                hint: "Enter employee role"),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  color: Colors.grey[500],
                  text: "Cancel",
                  press: () {
                    Navigator.of(context).pop();
                  },
                  width: 80,
                  height: 30,
                  radius: 4,
                ),
                Button(
                  text: "Add",
                  press: () {
                    Navigator.of(context).pop();
                  },
                  width: 50,
                  height: 30,
                  radius: 5,
                ),
                // SizedBox(height: size.height * 0.01),
                // Button(
                //   text: "Update",
                //   press: () {
                //     Navigator.of(context).pop();
                //   },
                //   width: 80,
                //   height: 30,
                //   radius: 5,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
