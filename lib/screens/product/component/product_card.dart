import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop/constants.dart';
import 'package:furniture_shop/models/product.dart';

class productCard extends StatelessWidget {
  const productCard({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Product product;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 160,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      // color: Colors.blueAccent,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 136,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: itemIndex.isEven ? kBlueColor : kSecondaryColor,
                  boxShadow: [kDefaultShadow]),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 160,
                  width: 200,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                )),
            // Product Title and Price
            Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 136,
                  width: size.width - 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 4),
                        decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text("\$ ${product.price}",
                            style: Theme.of(context).textTheme.button),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
