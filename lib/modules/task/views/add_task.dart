import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../models/event_model.dart';
import '../task.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  final EventDataModel event = Get.arguments;
  final controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}