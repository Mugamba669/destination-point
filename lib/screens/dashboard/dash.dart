import 'package:admin/models/Dash.dart';
import 'package:admin/widgets/CardView.dart';
import 'package:admin/widgets/MainView.dart';
import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  Dash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainView(
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemBuilder: ((context, index) => CardView(
                bottomText: '${DashItems.show[index].bottom}',
                icon: DashItems.show[index].icon,
                value: DashItems.show[index].value,
                topText: '${DashItems.show[index].top}',
                color: DashItems.show[index].color,
                tap: () => Navigator.of(context)
                    .pushNamed('${DashItems.show[index].route}'),
              )),
          separatorBuilder: (context, index) =>
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          itemCount: DashItems.show.length,
        ),
      ),
    );
  }
}
