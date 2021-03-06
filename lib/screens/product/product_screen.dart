import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop/constants.dart';
import 'package:furniture_shop/screens/product/component/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      title: Text('Dashboard'),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset("assets/icons/notification.svg"))
      ],
    );
  }
}
