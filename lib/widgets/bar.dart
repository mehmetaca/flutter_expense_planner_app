import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String title;
  final String value;
  final double fillPercantage;
  final Color fillColor;

  const Bar({
    Key? key,
    required this.title,
    required this.value,
    required this.fillPercantage,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40.0,
          child: FittedBox(
              child: Text(
            value,
            style: TextStyle(
              fontSize: 12.0,
            ),
          )),
        ),
        Container(
          width: 40,
          height: 100,
          color: Colors.white60,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(192, 198, 207, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: fillPercantage,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: fillColor),
                  child: Center(
                      child: Text(
                    '% ${(fillPercantage * 100).toInt()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13.0),
        ),
      ],
    );
  }
}
