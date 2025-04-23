import 'package:ecomerce_app/home/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Bigtext extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow Overflow;
  Bigtext(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.Overflow = TextOverflow.ellipsis,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: Overflow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          fontSize: Dimension.font20),
    );
  }
}
