import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../contants.dart';
import '../../../entity/response/ProductResponse.dart';
import '../order_page.dart';

class PriceContainer extends StatefulWidget {
  final Product product;
  final sizeType selectedSize;
  final ValueNotifier<int> itemCount;
  const PriceContainer({
    super.key,
    required this.product,
    required this.selectedSize,
    required this.itemCount,
  });

  @override
  _PriceContainerState createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product?.name ?? '',
                style: kProductNameStyle,
              ),
              Row(
                children: [
                  const Text(
                    '\$',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontFamily: 'sen',
                        fontSize: 24),
                  ),
                  Text(
                    '${widget.product.getPriceBySize(widget.selectedSize)}',
                    style: const TextStyle(
                        color: kSecondaryColor,
                        fontFamily: 'sen',
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              ValueListenableBuilder<int>(
                valueListenable: widget.itemCount,
                builder: (context, count, child) {
                  return GestureDetector(
                    onTap: () {
                      if (count > 1) {
                        widget.itemCount.value--;
                      }
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                        ),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              ),
              ValueListenableBuilder<int>(
                valueListenable: widget.itemCount,
                builder: (context, count, child) {
                  return Container(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        '$count', // Use 'count' here
                        style: const TextStyle(
                          fontFamily: 'sen',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: widget.itemCount,
                builder: (context, count, child) {
                  return GestureDetector(
                    onTap: () {
                      if (count < 9) {
                        widget.itemCount.value++;
                      }
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(30),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}