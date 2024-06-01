// Fake service to fetch receipt data from API
import 'dart:async';

import '../api/ReceiptController.dart';
import '../entity/response/ReceiptResponse.dart';

class ReceiptService{
  final _controller = StreamController<List<Result>>();

  // Fetch receipt data from API and add to stream - Ho Thanh Duy 21110759
  Stream<List<Result>> fetchAndAddReceiptResponse() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ReceiptAPI.getAllReceipts().then((receiptResponse) {
        _controller.sink.add(receiptResponse.result!);
      }).catchError((error) {
        _controller.sink.addError(error);
      });
    });

    return _controller.stream;
  }

  void dispose() {
    _controller.close();
  }
}