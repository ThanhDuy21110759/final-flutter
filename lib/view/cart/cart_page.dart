import 'package:coffee_ui/service/cart_service.dart';
import 'package:flutter/material.dart';

import '../../entity/response/CartResponse.dart';
import 'components/cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartService _cartService = CartService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Result>>(
      stream: _cartService.getCartItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Show error message if something went wrong
        } else if (snapshot.hasData) {
          List<Result> cartItems = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),
              title: const Text('Cart', style: TextStyle(color: Colors.white,),),
              backgroundColor: Colors.brown,
              actions: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total Price: 0', // Replace with your dynamic total price
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: cartItems.isEmpty
                ? const Center(child: Text('Cart is empty'))
                : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItem(result: cartItems[index], index: index,);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Customer\'s Phone', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      content: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: "Enter phone number"),
                        onChanged: (value) {
                          // Store your value here
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Confirm'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.payment, color: Colors.brown),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}