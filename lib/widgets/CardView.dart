import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  final String topText;
  final double value;
  final String bottomText;
  final Color color;
  final VoidCallback tap;
  final IconData icon;
  CardView(
      {Key? key,
      required this.tap,
      required this.topText,
      required this.value,
      required this.bottomText,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.tap(),
      child: Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Text(
                    widget.topText,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Text(
                    '${widget.value}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.bottomText,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: widget.color.withOpacity(0.6)),
                        child: Icon(
                          widget.icon,
                          size: 30,
                          color: widget.color,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
