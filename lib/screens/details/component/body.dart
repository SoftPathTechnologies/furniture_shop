import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop/constants.dart';
import 'package:furniture_shop/models/product.dart';
import 'package:furniture_shop/screens/details/component/color_dot.dart';
import 'package:furniture_shop/screens/details/component/color_list.dart';
import 'package:furniture_shop/screens/details/component/product_image.dart';
import 'package:toast/toast.dart';

class Body extends StatelessWidget {
  final Product products;

  const Body({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: ProductPoster(
                    size: size,
                    image: products.image,
                  ),
                ),
                ListOfColors(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    products.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  "\$${products.price}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kSecondaryColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    products.description,
                    style: TextStyle(color: kTextLightColor),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(kDefaultPadding),
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Color(0xFFFCBF1E),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset("assets/icons/chat.svg", height: 18),
                SizedBox(width: kDefaultPadding / 2),
                Text("Chat", style: TextStyle(color: Colors.white)),
                Spacer(),
                TextButton.icon(
                    onPressed: () => showToast("Item Added Successfully",
                        duration: Toast.lengthLong, gravity: Toast.top),
                    icon: SvgPicture.asset("assets/icons/shopping-bag.svg"),
                    label: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg,
        duration: duration, gravity: gravity, backgroundColor: kPrimaryColor);
  }
}
