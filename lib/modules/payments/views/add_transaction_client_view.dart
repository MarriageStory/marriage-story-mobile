import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/text_field_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../payments.dart';

class AddTransactionClientView extends StatelessWidget {
  AddTransactionClientView({Key? key}) : super(key: key);
  final PaymentClientController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      "Upload",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Pembayaran",
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
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextFieldInput(
                    title: "Tanggal Pembayaran",
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const TextFieldInput(
                    title: "Total Pembayaran",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Upload Bukti",
                            style: fontNunito.copyWith(
                              color: colorBlack,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Button(
                            height: 5.h,
                            width: 40.w,
                            onTap: () {},
                            colorBg: colorPink1,
                            label: "Upload Gambar",
                            textColor: colorWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                      height: 5.h,
                      width: 50.w,
                      onTap: () {},
                      colorBg: colorPink2,
                      label: "Upload",
                      textColor: colorWhite),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
