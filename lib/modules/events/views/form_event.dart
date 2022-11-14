// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
// import 'package:marriage_story_mobile/widgets/button.dart';
// import 'package:marriage_story_mobile/widgets/input_form.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../../constants/theme.dart';
// import '../../../utils/dateTime.dart';
// import '../../../widgets/number_form.dart';
// import '../event.dart';
// import 'package:get/get.dart';

// class FormEventView extends StatefulWidget {
//   FormEventView({super.key});

//   @override
//   State<FormEventView> createState() => _BodyState();
// }

// class _BodyState extends State<FormEventView> {
//   final controller = Get.find<EventController>();
//   final selectedPackage = [];

//   bool cekJam = false;
//   bool cekTgl = false;
//   DateTime tanggal = DateTime.now();
//   TimeOfDay time = TimeOfDay.now();

//   final TextStyle valueStyle = TextStyle(
//       color: Color(0xff828282), fontWeight: FontWeight.w500, fontSize: 14);

//   void showTime() {
//     showTimePicker(context: context, initialTime: TimeOfDay.now())
//         .then((value) {
//       setState(() {
//         cekJam = true;
//         controller.jamTextController.text = value!.format(context).toString();
//       });
//     });
//   }

//   Future<Null> _selectDate(BuildContext context) async {
//     // Initial DateTime FIinal Picked
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: tanggal,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2101));

//     if (picked != null && picked != tanggal)
//       setState(() {
//         cekTgl = true;
//         controller.tanggalTextController.text = picked.toString();
//         tanggal = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//             right: defaultPadding,
//             left: defaultPadding,
//             top: 6.h,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: () => Get.back(),
//                     icon: const Icon(
//                       Icons.arrow_back_ios_rounded,
//                       color: colorBlack,
//                     ),
//                   ),
//                   Text(
//                     "Tambah Acara",
//                     style: fontNunito.copyWith(
//                       color: colorBlack,
//                       fontWeight: semiBold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 4.h,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 4.h,
//               ),
//               Text(
//                 "Paket Acara",
//                 style: fontNunito.copyWith(
//                   color: colorBlack,
//                   fontWeight: semiBold,
//                   fontSize: 14,
//                 ),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               MultiSelectContainer(
//                 textStyles: const MultiSelectTextStyles(
//                   textStyle: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     color: colorPrimary,
//                     fontSize: 14,
//                   ),
//                 ),
//                 itemsDecoration: MultiSelectDecorations(
//                   decoration: BoxDecoration(
//                       color: colorWhite,
//                       border: Border.all(color: colorPrimary),
//                       borderRadius: BorderRadius.circular(20)),
//                   selectedDecoration: BoxDecoration(
//                       color: colorPrimary,
//                       border: Border.all(color: colorPrimary),
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//                 items: [
//                   MultiSelectCard(value: 'Pre-Wedding', label: 'Pre-Wedding'),
//                   MultiSelectCard(value: 'Engagement', label: 'Engagement'),
//                   MultiSelectCard(value: 'Akad', label: 'Akad'),
//                   MultiSelectCard(value: 'Panggih', label: 'Panggih'),
//                   MultiSelectCard(value: 'Resepsi', label: 'Resepsi'),
//                 ],
//                 onChange: (allSelectedItems, selectedItem) {
//                   if (selectedPackage.contains(selectedItem)) {
//                     selectedPackage.remove(selectedItem);
//                   } else {
//                     selectedPackage.add(selectedItem);
//                   }
//                   controller.selectedPackage1 = selectedPackage;
//                 },
//               ),
//               SizedBox(
//                 height: 4.h,
//               ),
//               Text(
//                 "Kelengkapan Acara",
//                 style: fontNunito.copyWith(
//                   color: colorBlack,
//                   fontWeight: semiBold,
//                   fontSize: 14,
//                 ),
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               InputForm(
//                 label: "Nama Pengantin",
//                 inputController: controller.namaKlientTextController,
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               dateTime(
//                 // labelText: "Date",
//                 valueText:
//                     cekTgl != false ? tanggal.toString() : "Tanggal Acara",
//                 valueStyle: valueStyle,
//                 onPressed: () {
//                   _selectDate(context);
//                 },
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               dateTime(
//                 // labelText: "Date",
//                 valueText: cekJam != false
//                     ? controller.jamTextController.text
//                     : "Waktu Acara",
//                 valueStyle: valueStyle,
//                 onPressed: () {
//                   showTime();
//                 },
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               NumberForm(
//                 label: "Total Pembayaran",
//                 inputController: controller.totalBayarTextController,
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Button(
//                 height: 6.h,
//                 width: 100.w,
//                 onTap: () {
//                   controller.createEvent();
//                 },
//                 colorBg: colorPrimary,
//                 label: "Tambah",
//                 textColor: colorWhite,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
