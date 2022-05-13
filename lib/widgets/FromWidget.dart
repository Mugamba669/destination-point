import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import 'input.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String inputHint;
  bool email;
  bool password;
  FormWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.inputHint,
    this.email = false,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.11,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  label,
                  style: labelText,
                ),
              ),
            ],
          ),
          InputField(
              controller: controller,
              password: password,
              email: email,
              hint: inputHint),
        ],
      ),
    );
  }
}
