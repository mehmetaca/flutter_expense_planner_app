import 'package:flutter/material.dart';

import '../global/app_constant.dart';

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
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
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
                  color: barDefaultBackgroundColor,
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
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
