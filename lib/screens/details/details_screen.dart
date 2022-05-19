import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop/constants.dart';
import 'package:furniture_shop/models/product.dart';
import 'package:furniture_shop/screens/details/component/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.products}) : super(key: key);
  final Product products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(products: products),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset("assets/icons/back.svg")),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/cart_with_item.svg"))
      ],
    );
  }
}
