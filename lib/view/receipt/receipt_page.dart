import 'dart:async';
import 'package:coffee_ui/view/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/entity/response/ReceiptResponse.dart';

import '../../service/receipt_service.dart';
import 'components/receipt_list.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  final ReceiptService _receiptService = ReceiptService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
        title: const Text(
          'Receipt',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<List<Result>>(
          stream: _receiptService.fetchAndAddReceiptResponse(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty){
                return const Center(child: Text('No Receipts'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ReceiptItem(
                      result: snapshot.data![index],
                    );
                  },
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}