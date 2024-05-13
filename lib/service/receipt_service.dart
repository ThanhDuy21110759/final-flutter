import 'dart:async';

import '../api/ReceiptController.dart';
import '../entity/response/ReceiptResponse.dart';

class ReceiptService{
  final _controller = StreamController<List<Result>>();

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