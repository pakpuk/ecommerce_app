import 'package:ecomerce_app/controllers/controllers_popular.dart';
import 'package:ecomerce_app/home/App_column.dart';
import 'package:ecomerce_app/home/Expandabel_textWidget.dart';
import 'package:ecomerce_app/home/Icones_use_many_times.dart';
import 'package:ecomerce_app/home/dimensions.dart';
import 'package:ecomerce_app/widget/Text.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PageUi extends StatelessWidget {
 final int pageId;
  const PageUi(pageId,  {super.key, required this.pageId});
  @override
  Widget build(BuildContext context) {
    var product =Get.find<PopularProductController>().popularproductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.IMagesize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("téléchargement (10)"),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.ListviewImgsize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimension.width20, top: Dimension.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.raduis20),
                      topRight: Radius.circular(Dimension.raduis20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Appcolumn(text: "Chinese Slide"),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      Bigtext(
                        text: "Introduce",
                        size: Dimension.font26,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandabelTextwidget(
                        text:
                            "i  love pizza and tacos  i  love pizza and tacos i  love pizza and tacos i  love pizza and tacos ",
                      )))
                    ],
                  ))),
        ],
      ),
      //bottom navigation bar
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.raduis20 * 2),
            topRight: Radius.circular(Dimension.raduis20 * 2),
          ),
          color: Colors.white30,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.raduis20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.remove,
                  ),
                  SizedBox(width: Dimension.width10 / 2),
                  Bigtext(text: "0"),
                  SizedBox(width: Dimension.width10 / 2),
                  Icon(Icons.add)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.raduis20),
                color: Colors.green,
              ),
              child: Bigtext(
                text: "10 £ Add to carte",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
