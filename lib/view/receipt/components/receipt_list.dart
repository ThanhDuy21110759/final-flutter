import 'package:coffee_ui/view/receipt/components/receipt_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../entity/response/ReceiptResponse.dart';

class ReceiptItem extends StatelessWidget {
  final Result result;
  const ReceiptItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReceiptDetailPage(
                receipt: result,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.brown, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text('Receipt ID: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${result.id}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: result.receiptStatus == 'PROGRESS' ? Colors.yellow[800] : Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${result.receiptStatus}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('• Date: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('${result.date}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('• Total cost: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('\$${result.totalPrice}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}