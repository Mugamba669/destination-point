import 'package:flutter/material.dart';

class DashItems {
  String? top;
  String? bottom;
  double value;
  IconData icon;
  String? route;
  Color color;
  DashItems(
      {this.bottom,
      required this.color,
      required this.icon,
      this.top,
      this.route,
      required this.value});

  static List<DashItems> show = [
    DashItems(
        top: "RECEIPTS",
        value: 200,
        bottom: "View",
        route: '/receipts',
        icon: Icons.car_repair,
        color: Colors.green),
    DashItems(
        top: "DISPATCH FORMS",
        value: 46,
        route: '/forms',
        bottom: "View",
        icon: Icons.mail,
        color: Colors.blue),
    DashItems(
        top: "REPORTS",
        value: 200,
        route: '/reports',
        bottom: "View",
        icon: Icons.receipt,
        color: Colors.red),
    DashItems(
        top: "USERS",
        value: 14,
        route: '/users',
        bottom: "View",
        icon: Icons.person,
        color: Colors.amber),
  ];
}
