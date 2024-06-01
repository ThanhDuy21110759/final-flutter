// This file contains the product list widget which is used to display the product list in the home page.
// Ho Thanh Duy 21110759
import 'package:flutter/material.dart';
import '../../entity/response/ProductResponse.dart';

class ProductList extends StatelessWidget {
  final Product product;
  final Function onPress;
  const ProductList({
    required this.onPress,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.network('${product.image}'),
              // child: SvgPicture.asset('assets/images/latte.svg'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product!.name ?? '',
                  style: const TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'This is description of ${product.name ?? ''}',
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}