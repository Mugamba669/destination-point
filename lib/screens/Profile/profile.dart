import 'package:admin/Auth/Auth.dart';
import 'package:admin/models/PageTransition.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late AnimationController sAimation;
  @override
  void initState() {
    super.initState();
    sAimation = AnimationController(
        vsync: this, duration: Duration(milliseconds: 600), value: 6);
  }

  @override
  void dispose() {
    sAimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTransition(
        animation: sAimation,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 50,
                left: MediaQuery.of(context).size.width * 0.3,
                child: PhysicalModel(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  elevation: 8,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/splash.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 40,
                  left: 20,
                  child: BackButton(
                    onPressed: () => Navigator.of(context).pop(),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView(
                    children: [
                      Spacer(),
                      ListTile(
                        title: Text("${Auth().auth.currentUser!.email}"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
