import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:marriage_story_mobile/widgets/selected_card_vendor.dart';
import '../event.dart';

class AddEvent1View extends StatelessWidget {
  AddEvent1View({Key? key}) : super(key: key);
  final EventWeddingOrganizerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: marginTop,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 30),
                onPressed: () {},
              ),
              Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tambah",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Acara",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Paket Vendor",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: MultiSelectContainer(
                  textStyles: const MultiSelectTextStyles(
                    selectedTextStyle: TextStyle(
                      color: colorWhite,
                    ),
                    disabledTextStyle: TextStyle(
                      color: colorBlack,
                    ),
                  ),
                  itemsDecoration: MultiSelectDecorations(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    selectedDecoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [colorPink2, colorPink3],
                      ),
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                  ),
                  items: [
                    MultiSelectCard(
                      value: 'Pre wedding',
                      child: const SelectedCardVendor(
                        title: 'Pre Wedding',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Engagement',
                      child: const SelectedCardVendor(
                        title: 'Engagement',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Akad',
                      child: const SelectedCardVendor(
                        title: 'Akad',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Panggih',
                      child: const SelectedCardVendor(
                        title: 'Panggih',
                      ),
                    ),
                    MultiSelectCard(
                      value: 'Resepsi',
                      child: const SelectedCardVendor(
                        title: 'Resepsi',
                      ),
                    ),
                  ],
                  onChange: ((selectedItems, selectedItem) {}),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 47.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [colorPink2, colorPink3],
                      ),
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.toNamed(RouteName.addEventWeddingOrganizer2),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(
                        "Selanjutnya",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
