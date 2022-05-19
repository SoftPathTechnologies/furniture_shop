import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop/components/search_box.dart';
import 'package:furniture_shop/constants.dart';
import 'package:furniture_shop/models/product.dart';
import 'package:furniture_shop/screens/details/details_screen.dart';
import 'package:furniture_shop/screens/product/component/category_list.dart';
import 'package:furniture_shop/screens/product/component/product_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        searchBox(
          onChanged: (value) {},
        ),
        categoryList(),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Expanded(
            child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ),
            ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => productCard(
                    itemIndex: index,
                    product: products[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            products: products[index],
                          ),
                        ),
                      );
                    })),
          ],
        ))
      ],
    );
  }
}
