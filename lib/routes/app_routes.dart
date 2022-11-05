part of './app_pages.dart';

abstract class RouteName {
  static const splash = '/splash';
  static const navigation = '/navigation';
  static const role = '/role';
  static const landing = '/landing';
  static const login = '/login';
  static const register = '/register';
  static const other = '/other';
  static const home = '/home';
  static const event = '/event';
  
  static const detailEventClient = '/detail-event-client';
  static const eventWeddingOrganizer = '/event-wo';
  static const detailEventWeddingOrganizer = '/detail-event-wo';
  static const addEventWeddingOrganizer1 = '/add-event-1';
  static const addEventWeddingOrganizer2 = '/add-event-2';
  static const addEventWeddingOrganizer3 = '/add-event-3';
  static const paymentClient = '/payment-client';
  static const paymentWo = '/payment-wo';
  static const detailTaskClient = '/detail-task-client';
  static const taskWo = '/task-wo';
  static const detailTaskWo = '/detail-task-wo';
  static const addTaskWo = '/add-task-wo';
  static const detailPaymentWo = '/detail-payment-wo';
  static const detailTransactionWo = '/detail-transaction-wo';
  static const detailTransactionClient = '/detail-transaction-client';
  static const addTransactionClient = '/add-transaction-client';
}
