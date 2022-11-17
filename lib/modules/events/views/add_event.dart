import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../utils/dateTime.dart';
import '../../../widgets/button.dart';
import '../../../widgets/input_form.dart';
import '../../../widgets/number_form.dart';
import '../event.dart';

class AddEventView extends StatelessWidget {
  AddEventView({super.key});
  final EventController controller = Get.find();
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: 6.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    args == false ? "Tambah Acara" : "Edit Acara",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4.h,
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Paket Acara",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              MultiSelectContainer(
                textStyles: const MultiSelectTextStyles(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: colorPrimary,
                    fontSize: 14,
                  ),
                ),
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                      color: colorWhite,
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(20)),
                  selectedDecoration: BoxDecoration(
                      color: colorPrimary,
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(5)),
                ),
                items: [
                  MultiSelectCard(value: 'Pre-Wedding', label: 'Pre-Wedding'),
                  MultiSelectCard(value: 'Engagement', label: 'Engagement'),
                  MultiSelectCard(value: 'Akad', label: 'Akad'),
                  MultiSelectCard(value: 'Panggih', label: 'Panggih'),
                  MultiSelectCard(value: 'Resepsi', label: 'Resepsi'),
                ],
                onChange: (allSelectedItems, selectedItem) {
                  if (controller.selectedPackage.contains(selectedItem)) {
                    controller.selectedPackage.remove(selectedItem);
                  } else {
                    controller.selectedPackage.add(selectedItem);
                  }
                  controller.selected = controller.selectedPackage;
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Kelengkapan Acara",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InputForm(
                label: "Nama Pengantin",
                inputController: controller.namaClientTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              DateTime(
                // labelText: "Date",
                valueText: controller.cekTgl != false || args == true
                    ? controller.tanggal.toString()
                    : "Tanggal Acara",
                valueStyle: TextStyle(
                  color: colorGrey,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
                onPressed: () {
                  controller.dateTimePickerWidget(context);
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              NumberForm(
                label: "Total Pembayaran",
                inputController: controller.totalBayarTextController,
              ),
              SizedBox(
                height: 5.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () {
                  if (args == false) {
                    controller.createEvent();
                  } else {
                    controller.updateEvent();
                  }
                },
                colorBg: colorPrimary,
                label: args == false ? "Tambah" : "Simpan",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
