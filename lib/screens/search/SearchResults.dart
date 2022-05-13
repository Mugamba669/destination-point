import 'package:admin/models/PageTransition.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with TickerProviderStateMixin {
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
    return Scaffold(
      body: PageTransition(
        animation: sAimation,
        child: SafeArea(
            child: Center(
          child: Text("Search results.."),
        )),
      ),
    );
  }
}
