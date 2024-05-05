import 'package:coffee_ui/view/homepage/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../entity/product.dart';
import '../order_detail/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/menu.svg'),
          onPressed: () {
            print("Menu button pressed");
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/images/search.svg'),
            onPressed: () {
              print("Search button pressed");
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Text(
              'Coffee House',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductList(
                product: products[index],
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(
                        product: products[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}