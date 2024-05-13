import 'package:coffee_ui/service/CustomerService.dart';
import 'package:coffee_ui/view/receipt/components/receipt_list_item.dart';
import 'package:flutter/material.dart';
import '../../../entity/response/ReceiptResponse.dart';
import '../../../service/staff_service.dart';

class ReceiptDetailPage extends StatefulWidget {
  final Result receipt;
  const ReceiptDetailPage({super.key, required this.receipt});

  @override
  _ReceiptDetailPageState createState() => _ReceiptDetailPageState();
}
class _ReceiptDetailPageState extends State<ReceiptDetailPage> {
  final StaffService staffService = StaffService.instance;
  final CustomerService customerService = CustomerService.instance;

  @override
  void initState() {
    super.initState();
    staffService.getStaffInfo();
    customerService.getCustomerById(widget.receipt.customerId!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Order Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.brown,
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                  children:[
                    const Text('• Username: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('${staffService.staffResponse?.result?.username}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                  ]
              ),
              Row(
                  children:[
                    const Text('• Email: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('${staffService.staffResponse?.result?.email}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                  ]
              ),
              Row(
                children:[
                  const Text('• Order date: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('${widget.receipt.date}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                ]
              ),
              Row(
                  children:[
                    const Text('• Phone number: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('${customerService.customerResponse?.result?.phoneNumber}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                  ]
              ),
              Row(
                  children:[
                    const Text('• Name: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('${customerService.customerResponse?.result?.firstName} ${customerService.customerResponse?.result?.lastName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                  ]
              ),
              Row(
                  children:[
                    const Text('• Total price: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$${widget.receipt.totalPrice}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                  ]
              ),
              const SizedBox(height: 20),
              //this here
              Expanded(
                child: ListView.builder(
                  itemCount: widget.receipt.receiptItems?.length,
                  itemBuilder: (context, index) {
                    return CartReceiptItem(receiptItem: widget.receipt.receiptItems![index]);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here

            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.brown, shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text('Confirm', style: TextStyle(fontSize: 18),),
          ),
        ),
      ),
    );
  }
}