import 'package:admin/Auth/Auth.dart';
import 'package:admin/constants.dart';
import 'package:admin/widgets/Button.dart';
import 'package:admin/widgets/FromWidget.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final paidController = TextEditingController();
  final luggageController = TextEditingController();
  final receiverController = TextEditingController();
  final receiptController = TextEditingController();
  // final paidController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // margin: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            Text("Employee details", style: labelText),
            SizedBox(height: size.height * 0.02),
            FormWidget(
                controller: nameController,
                label: "Sender Name",
                inputHint: "Enter sender name"),
            FormWidget(
                controller: phoneController,
                label: "Sender Phone",
                inputHint: "Enter sender phone"),
            FormWidget(
                controller: receiverController,
                label: "Receiver Name",
                inputHint: "Enter receiver name"),
            FormWidget(
                controller: luggageController,
                label: "Laggage Name",
                inputHint: "Enter laggage name"),
            FormWidget(
                controller: paidController,
                label: "Amount paid",
                inputHint: "Enter amount paid"),
            FormWidget(
                controller: receiptController,
                label: "Receipt Number",
                inputHint: "Enter receipt number"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  textColor: Colors.black,
                  color: Colors.grey[300],
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
                    if (formKey.currentState!.validate()) {
                      var data = {
                        'sender': nameController.text,
                        "receiver": receiverController.text,
                        "luaggage_name": luggageController.text,
                        "paid_amount": paidController.text,
                        "sender_phone": phoneController.text,
                        "receipt_number": receiptController.text
                      };
                      var store = Auth().storeSession("dispatch_forms");
                      store
                          .add(data)
                          .then(
                            (value) => Dialog(
                              child: Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            ),
                          )
                          .whenComplete(() => ScaffoldMessenger(
                              child: SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text("Data stored successfully"))));
                    }
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
