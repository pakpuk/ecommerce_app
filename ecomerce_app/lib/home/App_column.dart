import 'package:ecomerce_app/home/dimensions.dart';
import 'package:ecomerce_app/home/main_Text_icon%20widget.dart';
import 'package:ecomerce_app/widget/Small_text.dart';
import 'package:ecomerce_app/widget/Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appcolumn extends StatelessWidget {
  const Appcolumn({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bigtext(text: text),
        SizedBox(height: Dimension.height10),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star_border_outlined,
                      size: 15,
                    )),
          ),
          SizedBox(width: Dimension.width15),
          Smalltext(text: "4.5"),
          SizedBox(
            width: Dimension.width20,
          ),
          Smalltext(text: " 1447 comments")
        ]),
        SizedBox(
          height: Dimension.height20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TexsxtAndIconwidget(
                Text: "normale",
                icon: Icons.circle_sharp,
                iconecolor: Colors.orange),
            TexsxtAndIconwidget(
                Text: "4.5 Km",
                icon: Icons.location_on,
                iconecolor: Color(0xFF332d2b)),
            TexsxtAndIconwidget(
                Text: "32 min",
                icon: Icons.access_time_rounded,
                iconecolor: Colors.orange),
          ],
        )
      ],
    );
  }
}
