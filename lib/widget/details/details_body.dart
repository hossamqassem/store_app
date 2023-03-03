import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/products.dart';
import 'package:store_app/widget/details/product_image.dart';

import 'color_dot.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: ProductImage(
                  size: size,
                  image: product.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding*1.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ColorDot(fillColor: kTextLightColor, isSelected: true),
                    ColorDot(fillColor: Colors.cyan, isSelected: false),
                    ColorDot(fillColor: Colors.blue, isSelected: false),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                child: Text(product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
               Text('price:\$${product.price}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor
                ),
              ),
              const SizedBox(height: kDefaultPadding,)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding/2),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5,
          vertical: kDefaultPadding/2),

          child: Text(product.description,
            style: TextStyle(
              color: Colors.white, fontSize: 19,
            ),
          ),
        )
      ],
    );
  }
}


