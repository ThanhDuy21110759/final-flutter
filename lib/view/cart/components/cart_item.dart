import 'package:coffee_ui/api/OrderController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../entity/response/CartResponse.dart';

class CartItem extends StatelessWidget {
  final Result result;
  final int index;
  const CartItem({
    super.key,
    required this.result,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.brown, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: SvgPicture.asset('assets/images/macchiato.svg', width: 60, height: 60),
        title: Text('${result.product!.name!} (${result.quantity})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: ${result.product!.size!.price}, Size: ${result.product!.size!.name}', style: const TextStyle(fontSize: 18)),
            for (var condiment in result.productCondimentDetails!.condiments!)
              Row(
                children: [
                  Text('  - ${condiment.condiment!.name}: ', style: const TextStyle(fontSize: 15)),
                  SvgPicture.asset('assets/images/sugar_3.svg', width: 15, height: 15),
                  Text(' (${condiment.quantity})', style: const TextStyle(fontSize: 15)),
                ],
              ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.brown),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirm'),
                  content: const Text('Are you sure you want to delete this item?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        OrderAPI.deleteOrder(index + 1);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}