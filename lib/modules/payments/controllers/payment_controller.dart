import 'package:get/get.dart';

import '../../../models/transaction_model.dart';
import '../../../services/transaction_service.dart';

class PaymentController extends GetxController {
  var task = <TransactionDataModel>[].obs;

  @override
  void onInit() {
    getAllTransaction();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllTransaction() async {
    try {
      final dataEvent = await TransactionService.getTransactions(0);
      if (dataEvent != null) {
        task.assignAll(dataEvent);
      }
    } catch (e) {
      print(e);
    }
  }
}
