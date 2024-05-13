import 'package:flutter/material.dart';
import '../../api/CondimentController.dart';
import '../../contants.dart';
import '../../entity/response/CondimentResponse.dart';
import '../../entity/response/ProductResponse.dart';
import 'components/add_to_cart_button.dart';
import 'components/codiment_container.dart';
import 'components/cup_size_container.dart';
import 'components/price_container.dart';
import 'components/product_container.dart';

enum sizeType { small, medium, large }

class OrderPage extends StatefulWidget {
  final Product product;
  const OrderPage({super.key, required this.product});

  static const String routeName = '/order';

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final ValueNotifier<int> itemCount = ValueNotifier<int>(1);
  final ValueNotifier<sizeType> selectedSize = ValueNotifier<sizeType>(sizeType.small);
  List<Condiment> condiments = [];
  Map<String, int> selectedCondiments = {};

  @override
  void initState() {
    super.initState();
    fetchCondiments();
  }

  void fetchCondiments() async {
    condiments = await CondimentAPI.getCondiments();
    setState(() {});
  }

  void handleSelectedAmountChanged(String condimentId, int amount) {
    setState(() {
      selectedCondiments[condimentId] = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ProductContainer(
              product: widget.product,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<sizeType>(
                    valueListenable: selectedSize,
                    builder: (context, size, child) {
                      return PriceContainer(
                        product: widget.product,
                        selectedSize: size,
                        itemCount: itemCount,
                      );
                    },
                  ),
                  CupSizeContainer(
                    onSizeSelected: selectedSize,
                  ),
                  Column(
                    children: [
                      if (condiments != null)
                        for (var condiment in condiments)
                          CondimentContainer(
                            condiment: condiment,
                            onSelectedAmountChanged: (amount) => handleSelectedAmountChanged(condiment.id.toString(), amount),
                          ),
                    ],
                  ),
                  AddToCartButton(
                      product: widget.product,
                      onSizeSelected: selectedSize,
                      selectedCondiments: selectedCondiments,
                      itemCount: itemCount,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}