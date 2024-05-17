import 'package:coffee_ui/api/ReceiptController.dart';
import 'package:coffee_ui/service/CustomerService.dart';
import 'package:coffee_ui/view/receipt/components/receipt_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../entity/response/CustomerResponse.dart';
import '../../../entity/response/ReceiptResponse.dart';
import '../../../entity/response/StaffResponse.dart';
import '../../../service/staff_service.dart';

class ReceiptDetailPage extends StatefulWidget {
  final Result receipt;
  const ReceiptDetailPage({super.key, required this.receipt});

  @override
  _ReceiptDetailPageState createState() => _ReceiptDetailPageState();
}

class _ReceiptDetailPageState extends State<ReceiptDetailPage> {
  final StaffService staffService = StaffService();
  final CustomerService customerService = CustomerService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StaffResponse>(
      stream: staffService.getStaffInfo(),
      builder: (context, staffSnapshot) {
        if (staffSnapshot.connectionState == ConnectionState.waiting) {
          return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(child: CircularProgressIndicator(),)
          );
        }
        if (staffSnapshot.hasError || staffSnapshot.data == null) {
          return Text('Error: ${staffSnapshot.error}');
        }
        StaffResponse? staffInfo = staffSnapshot.data;
        return widget.receipt.customerId != null ? StreamBuilder<CustomerResponse>(
          stream: customerService.getCustomerById(widget.receipt.customerId!),
          builder: (context, customerSnapshot) {
            if (customerSnapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(child: CircularProgressIndicator(),)
              );
            }
            if (customerSnapshot.hasError || customerSnapshot.data == null){
              return Text('Error: ${customerSnapshot.error}');
            }
            CustomerResponse? customerInfo = customerSnapshot.data;
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                          children:[
                            const Text('• Username: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('${staffInfo?.result?.username}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  const Text('• Email: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  Text('${staffInfo?.result?.email}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                                ]
                            ),
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
                            customerInfo?.result != null ? Text('${customerInfo?.result?.phoneNumber}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)) : Container(),
                          ]
                      ),
                      Row(
                          children:[
                            const Text('• Name: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            customerInfo?.result != null ? Text('${customerInfo?.result?.firstName} ${customerInfo?.result?.lastName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)) : Container(),
                          ]
                      ),
                      Row(
                          children:[
                            const Text('• Total price: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('\$${widget.receipt.totalPrice}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                          ]
                      ),
                      const SizedBox(height: 20),
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
                  child: widget.receipt.receiptStatus == 'PROGRESS' ? ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                      ReceiptAPI.updateReceiptStatus(widget.receipt.id);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.brown, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),),
                    child: const Text('Confirm', style: TextStyle(fontSize: 18),),
                  ) : const SizedBox(),
                ),
              ),
            );
          },
        ) : Container(
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                      children:[
                        const Text('• Username: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('${staffInfo?.result?.username}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              const Text('• Email: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text('${staffInfo?.result?.email}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                            ]
                        ),
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
                        const Text('• Total price: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('\$${widget.receipt.totalPrice}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ]
                  ),
                  const SizedBox(height: 20),
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
              child: widget.receipt.receiptStatus == 'PROGRESS' ? ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                  ReceiptAPI.updateReceiptStatus(widget.receipt.id);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.brown, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),),
                child: const Text('Confirm', style: TextStyle(fontSize: 18),),
              ) : const SizedBox(),
            ),
          ),
        );
      },
    );
  }
}