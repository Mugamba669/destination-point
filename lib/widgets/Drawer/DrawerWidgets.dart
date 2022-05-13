import 'package:flutter/material.dart';

class DWidgets {
  String? title;
  IconData? icon;
  String? route;
  DWidgets({this.title, this.icon, this.route});
  static List<DWidgets> widgets = [
    DWidgets(title: "Dashboard", icon: Icons.dashboard, route: '/dashboard'),
    DWidgets(
        title: "Dispatch Forms",
        icon: Icons.file_copy_rounded,
        route: '/forms'),
    DWidgets(title: "Reports", icon: Icons.receipt, route: '/reports'),
    DWidgets(title: "Users", icon: Icons.person, route: '/users'),
    DWidgets(title: "Logout", icon: Icons.logout)
  ];
}
