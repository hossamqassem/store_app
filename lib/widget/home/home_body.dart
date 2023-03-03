import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/screens/details_screen.dart';
import 'package:store_app/widget/home/product_card.dart';
import '../../models/products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Expanded(
            child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70),
              decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
            ),
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                itemIndex: index,
                product: Product(
                    id: products[index].id,
                    price: products[index].price,
                    title: products[index].title,
                    subTitle: products[index].subTitle,
                    description: products[index].description,
                    image: products[index].image),
                    press: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(
                    product: products[index],
                  )));
                    },
              ),
            ),
          ],
        )),
      ],
    ));
  }
}
