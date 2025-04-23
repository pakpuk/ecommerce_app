import 'package:ecomerce_app/home/dimensions.dart';
import 'package:ecomerce_app/home/Popular_food_page.dart';
import 'package:ecomerce_app/widget/Small_text.dart';
import 'package:ecomerce_app/widget/Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFoodpage extends StatefulWidget {
  const MainFoodpage(pageId, {super.key});

  @override
  State<MainFoodpage> createState() => _MainFoodpageState();
}

class _MainFoodpageState extends State<MainFoodpage> {
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
              margin: EdgeInsets.only(
                  top: Dimension.height20, bottom: Dimension.height20),
              padding: EdgeInsets.only(
                  left: Dimension.width10, right: Dimension.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Bigtext(text: "Algeria"),
                      Row(
                        children: [
                          Smalltext(
                            text: "Setif",
                            color: Colors.black45,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimension.height45,
                      height: Dimension.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(255, 101, 223, 105),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimension.iconsize24,
                      ),
                    ),
                  )
                ],
              )),
        ),
        Expanded(child: SingleChildScrollView(child: FoodpageBody())),
      ],
    ));
  }
}
