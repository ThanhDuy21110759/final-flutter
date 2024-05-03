import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../entity/product.dart';

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
              width: 60,
              child: SvgPicture.asset(product.image),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'This is description of ${product.name}',
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