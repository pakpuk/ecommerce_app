import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecomerce_app/controllers/controllers_popular.dart';
import 'package:ecomerce_app/controllers/recomandeed_product_controller.dart';
import 'package:ecomerce_app/home/AppConstants.dart';
import 'package:ecomerce_app/home/App_column.dart';
import 'package:ecomerce_app/home/dimensions.dart';
import 'package:ecomerce_app/home/main_Text_icon%20widget.dart';
import 'package:ecomerce_app/models/model.dart';
import 'package:ecomerce_app/widget/Small_text.dart';
import 'package:ecomerce_app/widget/Text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodpageBody extends StatefulWidget {
  const FoodpageBody({super.key});

  @override
  State<FoodpageBody> createState() => _FoodpageBodyState();
}

class _FoodpageBodyState extends State<FoodpageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentpage = 0.0;
  var scalefactor = 0.8;
  double height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentpage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (products) {
          return products.isLoading
              ? Container(
                  height: Dimension.pageview,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: products.popularproductList.length,
                    itemBuilder: (context, position) {
                      return _buildpaageitem(
                          position, products.popularproductList[position]);
                    },
                  ))
              : CircularProgressIndicator(
                  color: Colors.grey,
                );
        }),
        GetBuilder<PopularProductController>(builder: (products) {
          return DotsIndicator(
            dotsCount: products.popularproductList.isEmpty
                ? 1
                : products.popularproductList.length,
            position: _currentpage.floor() as int,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(height: Dimension.height30),
        //the popular fairingfood text---------------------------
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            children: [
              Bigtext(
                text: "Recomanded",
                size: Dimension.font20,
              ),
              SizedBox(width: Dimension.width10),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Bigtext(
                  text: ".",
                ),
              ),
              SizedBox(width: Dimension.width10),
              Container(child: Smalltext(text: "Food paining")),
            ],
          ),
        ),
        //list of food--------------------------------------------------------
        SizedBox(
          height: Dimension.height30,
        ),
        GetBuilder<RecomandedProductController>(builder: (Recoproduct) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Recoproduct.recoproductList.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      bottom: Dimension.height10),
                  child: Row(children: [
                    Container(
                      height: Dimension.ListviewImgsize,
                      width: Dimension.ListviewImgsize,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.raduis20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(AppConstant.BaseUrl +
                                  "/uploads/" +
                                  Recoproduct.recoproductList[index].img!))),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimension.Listtviewcontsize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimension.raduis20),
                                bottomRight:
                                    Radius.circular(Dimension.raduis20))),
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimension.width10,
                                right: Dimension.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Bigtext(text: Recoproduct.recoproductList[index].name!),
                                SizedBox(
                                  height: Dimension.height10,
                                ),
                                Smalltext(text: "with chinese charactrestics"),
                                SizedBox(
                                  height: Dimension.height10,
                                ),
                                Row(
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
                            )),
                      ),
                    )
                  ]),
                );
              }));
        }),
      ],
    );
  }

//buildpageitem function--------------------------------------
  Widget _buildpaageitem(int index, ProductModel popularproduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentpage.floor()) {
      var currscale = 1 - (_currentpage - index) * (1 - scalefactor);
      var currtruns = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtruns, 0);
    } else if (index == _currentpage.floor() + 1) {
      var currscale =
          scalefactor + (_currentpage - index + 1) * (1 - scalefactor);
      var currtruns = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtruns, 0);
    } else if (index == _currentpage.floor() - 1) {
      var currscale = 1 - (_currentpage - index) * (1 - scalefactor);
      var currtruns = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtruns, 0);
    } else {
      var currscale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, height * ((1 - currscale) / 2), 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height: Dimension.pageviewcontainer,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.raduis30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstant.BaseUrl +
                          "/uploads/" +
                          popularproduct.img!)))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimension.pageviewTextcontainer,
                margin: EdgeInsets.only(
                    left: Dimension.raduis30,
                    right: Dimension.raduis30,
                    bottom: Dimension.height15,
                    top: Dimension.height15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.raduis30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffe8e8e8e8),
                        offset: Offset(0, 5),
                        blurRadius: 5.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      left: Dimension.raduis15,
                      right: Dimension.raduis15,
                      bottom: Dimension.height15,
                      top: Dimension.height10),
                  child: Appcolumn(text: popularproduct.name! ),
                ),
              ))
        ],
      ),
    );
  }
}

