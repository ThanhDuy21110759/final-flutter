import 'package:flutter/material.dart';

import '../../contants.dart';
import '../../entity/product.dart';
import 'components/add_to_cart_button.dart';
import 'components/cup_size_container.dart';
import 'components/price_container.dart';
import 'components/product_container.dart';
import 'components/sugar_container.dart';

class OrderPage extends StatelessWidget {
  final Product product;
  const OrderPage({super.key, required this.product});

  static const String routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ProductContainer(
              product: product,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriceContainer(
                    product: product,
                  ),
                  CupSizeContainer(),
                  SugarContainer(),
                  AddToCartButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}