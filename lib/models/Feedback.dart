import 'package:flutter/material.dart';

import 'package:wiredash/wiredash.dart';

class Feeds extends StatelessWidget {
  Feeds({Key? key}) : super(key: key);
//
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      secret: 'trIpAaHP-jBEqOuFl1iNFrbQcVID9AH_',
      projectId: 'destinationpoint-ysmr7jm',
      navigatorKey: _navigatorKey,
      child: Container(),
    );
  }
}
