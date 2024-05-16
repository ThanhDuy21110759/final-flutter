import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants.dart';
import '../../../entity/response/ProductResponse.dart';

class ProductContainer extends StatelessWidget {
  final Product product;
  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 340,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 28), blurRadius: 80)
            ],
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            height: 160,
            width: 180,
            child: Image.network('${product.image}'),
            // child: SvgPicture.asset('assets/images/latte.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16, horizontal: kDefaultPadding),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
              Expanded(
                child: Text(
                  product?.name ?? '',
                  style: kProductNameStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 50,
              )
            ],
          ),
        )
      ],
    );
  }
}