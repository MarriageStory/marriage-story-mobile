import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:marriage_story_mobile/widgets/card_transaction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../widgets/event_pack.dart';
import '../../events/event.dart';
import '../payment.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/utils/format_angka.dart';

class DetailPaymentView extends StatelessWidget {
  DetailPaymentView({super.key});
  final controller = Get.find<PaymentController>();
  final EventController eventController = Get.find();
  final EventDataModel event = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(gradient: colorGradient),
              child: Padding(
                padding: EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  top: 6.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
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
                                color: colorWhite,
                              ),
                            ),
                            Text(
                              "Detail Pembayaran",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/payment.png",
                            width: 20.w,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                "Total Pembayaran :",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                FormatAngka.convertToIdr(
                                    int.parse(event.totalPembayaran.toString()),
                                    2),
                                overflow: TextOverflow.ellipsis,
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 33.h),
              decoration: const BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius2),
                  topRight: Radius.circular(defaultBorderRadius2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  top: 5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pernikahan ${event.namaClient}",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: fontNunito.copyWith(
                            color: colorPrimary,
                            fontWeight: semiBold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        FittedBox(
                          fit: BoxFit.fill,
                          child: SizedBox(
                            width: 70.w,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              itemCount: eventController.events.isEmpty
                                  ? 0
                                  : eventController.events.first.paket.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 3,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                var paket =
                                    eventController.events.first.paket[index];
                                return EventPack(
                                  label: paket.deskripsi,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colorPrimary.withOpacity(0.3),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Transaksi ",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: fontNunito.copyWith(
                                color: colorPrimary,
                                fontWeight: bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Jumlah Transaksi :",
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: medium,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    controller.payments.length.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Total Transaksi :",
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: medium,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    FormatAngka.convertToIdr(
                                        int.parse(
                                            event.jumlahTerbayar.toString()),
                                        2),
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Semua Transaksi",
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    event.paymentDetails.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: CardTransaction(
                                  onTap: () {
                                    Get.toNamed(RouteName.transaction,
                                        arguments: event.paymentDetails[index]);
                                  },
                                  label:
                                      event.paymentDetails[index].namaPayment,
                                  date: DateFormat('dd MMM yyyy')
                                      .format(
                                          event.paymentDetails[index].datetime)
                                      .toString(),
                                  amount: FormatAngka.convertToIdr(
                                      int.parse(event
                                          .paymentDetails[index].total
                                          .toString()),
                                      2),
                                ),
                              );
                            },
                            itemCount: event.paymentDetails.length)
                        : Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Center(
                              child: Text(
                                "Belum ada Transaksi",
                                style: fontNunito.copyWith(
                                  color: colorGrey,
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
