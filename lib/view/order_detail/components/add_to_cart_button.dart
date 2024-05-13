import 'package:coffee_ui/view/bottom_nav_bar.dart';
import 'package:coffee_ui/view/forgot_password.dart';
import 'package:coffee_ui/view/homepage/home_page.dart';
import 'package:flutter/material.dart';

import '../../../contants.dart';
import '../../../entity/response/ProductResponse.dart';
import '../../../service/cart_service.dart';
import '../../cart/cart_page.dart';
import '../order_page.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;
  final Map<String, int> selectedCondiments;
  final ValueNotifier<sizeType> onSizeSelected;
  final ValueNotifier<int> itemCount;
  const AddToCartButton({
    super.key,
    required this.product,
    required this.selectedCondiments,
    required this.onSizeSelected,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: itemCount,
      builder: (context, count, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: GestureDetector(
              onTap: () async {
                await CartService().addProductToCart(
                  product.id!,
                  itemCount.value,
                  onSizeSelected.value,
                  selectedCondiments,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBar(initialIndex: 2),
                  ),
                );
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffeedace),
                          offset: Offset(0, 20),
                          blurRadius: 30)
                    ]),
                child: const Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            'Purchase',
                            style: TextStyle(fontFamily: 'sen', fontSize: 20, color: Colors.white),
                          ),
                        ]
                    )
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}