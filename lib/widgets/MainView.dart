import 'package:admin/Auth/Auth.dart';
import 'package:flutter/material.dart';

import '../models/PageTransition.dart';
import 'Drawer/DrawerWidgets.dart';

class MainView extends StatefulWidget {
  final Widget content;
  const MainView({Key? key, required this.content}) : super(key: key);
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      value: 4,
    );
    super.initState();
  }

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return PageTransition(
      animation: animationController,
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                if (!_key.currentState!.isDrawerOpen) {
                  _key.currentState?.openDrawer();
                }
              },
              child: Icon(Icons.menu, color: Colors.black)),
          backgroundColor: Colors.white,
          actions: [
            CircleAvatar(
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/search'),
                ),
                backgroundColor: Colors.white),
            SizedBox(width: 30),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/profile'),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  child: Image.asset("assets/images/profile_pic.png"),
                ),
              ),
            )
          ],
        ),
        body: widget.content,
        drawer: Drawer(
          elevation: 20,
          child: Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "Desination point",
                    style: TextStyle(
                      fontFamily: 'Dancing',
                      fontSize: 23,
                    ),
                  ),
                  accountEmail: Text("Signed in as ${Auth().getUser()}"),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => index != 4
                        ? ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed(
                                  '${DWidgets.widgets[index].route}');
                            },
                            title: Text('${DWidgets.widgets[index].title}'),
                            leading: Icon(DWidgets.widgets[index].icon),
                          )
                        : ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              Auth().logoutUser(context);
                            },
                            title: Text('${DWidgets.widgets[index].title}'),
                            leading: Icon(DWidgets.widgets[index].icon),
                          ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: DWidgets.widgets.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
