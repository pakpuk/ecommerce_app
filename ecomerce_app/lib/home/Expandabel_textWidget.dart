import 'package:ecomerce_app/home/dimensions.dart';
import 'package:ecomerce_app/widget/Small_text.dart';
import 'package:flutter/material.dart';

class ExpandabelTextwidget extends StatefulWidget {
  final String text;
  const ExpandabelTextwidget({super.key, required this.text});
  @override
  _ExpandabelTextwidgetState createState() => _ExpandabelTextwidgetState();
}

class _ExpandabelTextwidgetState extends State<ExpandabelTextwidget> {
  late String firsthalf;
  late String secondHalf;
  final double texthalf = Dimension.screeenHeight / 5.63;
  bool Hiddentext = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > texthalf) {
      firsthalf = widget.text.substring(0, texthalf.toInt());
      secondHalf =
          widget.text.substring(texthalf.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondHalf = " ";
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: secondHalf.isEmpty
            ? Smalltext(text: firsthalf)
            : Column(
                children: [
                  Smalltext(
                      height: 1.8,
                      color: Colors.black,
                      text: Hiddentext
                          ? (firsthalf + "...")
                          : (firsthalf + secondHalf)),
                  InkWell(
                    onTap: () {
                      Hiddentext = !Hiddentext;
                    },
                    child: Row(
                      children: [
                        Smalltext(
                          text: Hiddentext ? "show more" : "show less",
                          color: Colors.green,
                        ),
                        Icon(
                            Hiddentext
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: Colors.green)
                      ],
                    ),
                  )
                ],
              ),
      );
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
