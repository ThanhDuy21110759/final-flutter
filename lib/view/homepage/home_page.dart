import 'package:coffee_ui/service/product_service.dart';
import 'package:coffee_ui/view/homepage/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../entity/response/ProductResponse.dart';
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
            Expanded(
              child: StreamBuilder<List<Product>>(
                stream: ProductService().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data![index].productType != "FOOD"
                            && snapshot.data![index].productStatus != "OUTSTOCK"){
                          return ProductList(
                            product: snapshot.data![index],
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(
                                    product: snapshot.data![index],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}