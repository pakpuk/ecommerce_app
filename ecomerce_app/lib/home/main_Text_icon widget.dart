import 'dart:ui';

import 'package:ecomerce_app/widget/Small_text.dart';
import 'package:flutter/material.dart';

class TexsxtAndIconwidget extends StatelessWidget {
  const TexsxtAndIconwidget({
    super.key,
    required this.Text,
    required this.icon,
    required this.iconecolor,
  });
  final String Text;
  final IconData icon;
  final Color iconecolor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconecolor,
        ),
        SizedBox(width: 5),
        Smalltext(text: Text)
      ],
    );
  }
}
