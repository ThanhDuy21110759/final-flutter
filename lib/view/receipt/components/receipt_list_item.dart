import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../entity/response/ReceiptResponse.dart';

class CartReceiptItem extends StatelessWidget {
  final ReceiptItems receiptItem;
  const CartReceiptItem({super.key, required this.receiptItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.brown, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: SvgPicture.asset('assets/images/macchiato.svg', width: 60, height: 60),
        title: Text('${receiptItem.product!.name!} (${receiptItem.quantity})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: ${receiptItem.product!.size!.price}, Size: ${receiptItem.product!.size!.name}', style: const TextStyle(fontSize: 18)),
            for (var condiment in receiptItem.productCondimentDetails!.condiments!)
              Row(
                children: [
                  Text('  - ${condiment.condiment!.name}: ', style: const TextStyle(fontSize: 15)),
                  SvgPicture.asset('assets/images/sugar_3.svg', width: 15, height: 15),
                  Text(' (${condiment.quantity})', style: const TextStyle(fontSize: 15)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}