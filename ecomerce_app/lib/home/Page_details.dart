import 'package:ecomerce_app/home/Expandabel_textWidget.dart';
import 'package:ecomerce_app/home/Icones_use_many_times.dart';
import 'package:ecomerce_app/home/dimensions.dart';
import 'package:ecomerce_app/widget/Text.dart';
import 'package:flutter/material.dart';

class RecomendedFoodpage extends StatelessWidget {
  const RecomendedFoodpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.raduis20),
                    topRight: Radius.circular(Dimension.raduis20),
                  )),
                  child: Center(
                    child: Bigtext(text: "Chinese side"),
                  ),
                )),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images.jpg",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.only(
                left: Dimension.width20, right: Dimension.width20),
            child: ExpandabelTextwidget(
                text:
                    "i love ramdan i love ramdani love ramdani love ramdani love ramdani love ramdani love ramdani love ramdan "),
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    backgroundcolor: Colors.green,
                    size: Dimension.iconsize24,
                    Iconecolor: Colors.white,
                    icon: Icons.add),
                Bigtext(text: "£12" + "X" + "0"),
                AppIcon(
                    backgroundcolor: Colors.green,
                    size: Dimension.iconsize24,
                    Iconecolor: Colors.white,
                    icon: Icons.remove),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    size: Dimension.iconsize24,
                    color: const Color.fromARGB(255, 46, 74, 47),
                  ),
                )
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
    );
  }
}
