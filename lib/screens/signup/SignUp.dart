// ignore_for_file: deprecated_member_use

import 'package:admin/Auth/Auth.dart';
import 'package:admin/constants.dart';
import 'package:admin/models/User.dart';
import 'package:admin/screens/signup/components/body.dart';
import 'package:admin/widgets/Button.dart';
import 'package:admin/widgets/FromWidget.dart';
import 'package:admin/widgets/Space.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  late AnimationController animation;
  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000), value: 6);
    super.initState();
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cpassController = TextEditingController();
  // form key for form validation and content management
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Body(
        child: SizedBox(
          height: s.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Space(),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: 'dancing',
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Space(),
                Space(),
                SizedBox(
                  height: s.height * 0.7,
                  child: Card(
                    elevation: 8,
                    child: Form(
                      key: formKey,
                      child: ListView(
                        children: [
                          Space(),
                          Space(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormWidget(
                                controller: emailController,
                                label: "Email",
                                inputHint: "Enter your email"),
                          ),
                          Space(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormWidget(
                                controller: passController,
                                label: "Password",
                                inputHint: "Enter your email"),
                          ),
                          Space(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormWidget(
                                controller: cpassController,
                                label: "Confirm password",
                                inputHint: "Enter your email"),
                          ),
                          Space(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Button(
                                text: "Sign Up",
                                press: () {
                                  if (formKey.currentState!.validate() ==
                                      true) {
                                    (passController.text.length ==
                                            cpassController.text.length)
                                        ? Auth().createAccount(
                                            AUser(
                                                email: emailController.text,
                                                password: cpassController.text),
                                            context)
                                        : Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                  "Password miss match!!!"),
                                            ),
                                          );
                                  }
                                },
                                width: s.width * 0.5,
                                height: 40,
                                radius: 5),
                          ),
                          Space(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Already have an account.",
                                style: labelText,
                              ),
                              Button(
                                fontSize: 18,
                                textbutton: true,
                                text: "Login",
                                press: () =>
                                    Navigator.of(context).pushNamed("/"),
                                width: s.width * 0.5,
                                height: 45,
                                radius: 5,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        animation: animation);
  }
}
