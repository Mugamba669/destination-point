import 'package:admin/Auth/Auth.dart';
import 'package:admin/models/PageTransition.dart';
import 'package:admin/screens/Login/components/back.dart';
import 'package:admin/widgets/Space.dart';
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
    return Back(
        background: Colors.grey[400],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/splash.png"),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      child: CircleAvatar(
                    child: BackButton(),
                  ))
                ],
              ),
            ),
            Space(
              space: 0.3,
            ),
            ListTile(
              title: Text("Signed In email"),
              trailing: Text("${Auth().auth.currentUser!.email}"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign out"),
              onTap: () => Auth().logoutUser(context),
            )
          ],
        ),
        animation: sAimation);
  }
}
