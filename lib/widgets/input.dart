// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  bool email = false;
  String? error;
  bool password = false;
  InputField(
      {Key? key,
      this.error,
      required this.controller,
      required this.password,
      required this.email,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.057,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          }
          return null;
        },
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType:
            email == true ? TextInputType.emailAddress : TextInputType.text,
        obscureText: password,
        decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromARGB(255, 45, 51, 134),
            ),
          ),
          hintStyle: TextStyle(color: Colors.black26),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black26,
            ),
          ),
          enabled: true,
        ),
      ),
    );
  }
}
