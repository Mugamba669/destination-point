import 'package:admin/Auth/Auth.dart';
import 'package:admin/constants.dart';
import 'package:admin/models/PageTransition.dart';
import 'package:admin/models/User.dart';
import 'package:admin/screens/Login/components/back.dart';
import 'package:admin/widgets/Button.dart';

import 'package:admin/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late final AnimationController animation;
  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000), value: 6);

    animation.addListener(() {
      animation.animateTo(300,
          duration: Duration(milliseconds: 200), curve: Curves.decelerate);
    });
    super.initState();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageTransition(
      animation: animation,
      child: Back(
        animation: animation,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.04),
                Center(
                  child: Text(
                    "Destination Point!",
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Dancing',
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "keeping track of your journey..",
                    style: TextStyle(
                        fontFamily: 'Dancing',
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                SizedBox(
                  height: size.height / 1.8,
                  child: Card(
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "Welcome Back",
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: 'Arial',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Sign in to continue",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black26,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Username",
                                  style: labelText,
                                ),
                              ),
                            ],
                          ),
                          InputField(
                            controller: _emailController,
                            error: "Email is required",
                            hint: 'Enter your email',
                            password: false,
                            email: true,
                          ),
                          SizedBox(height: size.height * 0.03),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Password",
                                  style: labelText,
                                ),
                                SizedBox(height: size.height * 0.03),
                                Text(
                                  "Forgot password ?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          InputField(
                            controller: _passwordController,
                            hint: 'Enter your password',
                            password: true,
                            error: "Password is required",
                            email: false,
                          ),
                          SizedBox(height: size.height * 0.03),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Button(
                              color: Colors.indigo[400],
                              press: () {
                                if (formKey.currentState!.validate()) {
                                  Auth().userLogin(
                                      AUser(
                                          email: _emailController.text,
                                          password: _passwordController.text),
                                      context);
                                }
                              },
                              width: size.width,
                              height: 50,
                              radius: 20,
                              text: "LOGIN",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Don't have an account ?",
                                  style: labelText,
                                ),
                                TextButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed("/signup"),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
