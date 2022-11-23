import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:marriage_story_mobile/widgets/card_payment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card_event.dart';
import '../../../widgets/card_transaction.dart';
import '../../../widgets/event_pack.dart';
import '../../events/controllers/event_controller.dart';
import '../../home/home.dart';
import '../payment.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/utils/formatAngka.dart';

class PaymentView extends StatelessWidget {
  PaymentView({super.key});
  final controller = Get.find<PaymentController>();
  final controllerHome = Get.find<HomeController>();
  final EventController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controllerHome.user.value.roleId == 1
            ? SingleChildScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pembayaran",
                                      style: fontNunito.copyWith(
                                        color: colorWhite,
                                        fontWeight: bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          controller.formAddTransaction(),
                                      // Get.toNamed(
                                      //     RouteName.addTransactionClient),
                                      icon: const Icon(
                                        Icons.add_rounded,
                                        color: colorWhite,
                                      ),
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
                                        eventController.events.isNotEmpty
                                            ? formatAngka.convertToIdr(
                                                int.parse(eventController
                                                        .events.isEmpty
                                                    ? "0"
                                                    : eventController.events
                                                        .first.totalPembayaran
                                                        .toString()),
                                                2)
                                            : "0",
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
                      margin: EdgeInsets.only(top: 35.h),
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
                          top: 6.h,
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
                                  eventController.events.isEmpty
                                      ? "-"
                                      : eventController.events.first.namaClient,
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
                                SizedBox(
                                  width: 70.w,
                                  child:
                                      // Wrap(
                                      //   spacing: 5.0,
                                      //   runSpacing: 5.0,
                                      //   direction: Axis.horizontal,
                                      //   children: [
                                      // EventPack(label: "Pre Wedding"),
                                      // EventPack(label: "Akad"),
                                      // EventPack(label: "Akad"),
                                      // EventPack(label: "Akad"),
                                      // EventPack(label: "Akad"),
                                      // EventPack(label: "Akad"),
                                      ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    // scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var paket = eventController
                                          .events.first.paket[index];
                                      return Wrap(spacing: 5.0, runSpacing: 5.0,
                                          // direction: Axis.horizontal,
                                          children: [
                                            EventPack(label: paket.deskripsi)
                                          ]);
                                    },
                                    itemCount: eventController.events.isEmpty
                                        ? 0
                                        : eventController
                                            .events.first.paket.length,
                                  ),
                                  //   ],
                                  // ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              width: 100.w,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Jumlah Transaksi :",
                                            overflow: TextOverflow.ellipsis,
                                            style: fontNunito.copyWith(
                                              color: colorPrimary,
                                              fontWeight: medium,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            controller.payments.length
                                                .toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Total Transaksi :",
                                            overflow: TextOverflow.ellipsis,
                                            style: fontNunito.copyWith(
                                              color: colorPrimary,
                                              fontWeight: medium,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            formatAngka.convertToIdr(
                                                int.parse(eventController
                                                            .events.length ==
                                                        0
                                                    ? "0"
                                                    : eventController.events
                                                        .first.jumlahTerbayar
                                                        .toString()),
                                                2),
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
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (BuildContext context, int index) {
                                var paymentSort =
                                    controller.payments.reversed.toList();
                                var payment = paymentSort[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: CardTransaction(
                                    onTap: () => Get.toNamed(
                                        RouteName.transaction,
                                        arguments: payment),
                                    data: payment,
                                  ),
                                );
                              },
                              itemCount: controller.payments.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
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
                                Text(
                                  "Pembayaran",
                                  style: fontNunito.copyWith(
                                    color: colorWhite,
                                    fontWeight: bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Text(
                                "Jumlah Pembayaran :",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Text(
                                "3",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      margin: EdgeInsets.only(top: 35.h),
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
                            Text(
                              "Semua Pembayaran",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: semiBold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // CardPayment(
                            //   onTap: () => Get.toNamed(RouteName.detailPayment),
                            //   label: "Pernikahan Semuanya",
                            //   date: "23 April ",
                            //   eventPack: "Pack",
                            //   amount: "Rp 30.000.000",
                            // ),
                            eventController.events.isNotEmpty
                                ? ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String tanggal =
                                          DateFormat('dd-MMM-yyyy - HH:mm')
                                              .format(eventController
                                                  .events[index].datetime);
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: CardPayment(
                                          onTap: () => Get.toNamed(
                                              RouteName.detailPayment,
                                              arguments: eventController
                                                  .events[index]),
                                          label: eventController
                                              .events[index].namaClient,
                                          date: tanggal,
                                          eventPack: eventController
                                                  .events[index].paket.isEmpty
                                              ? "-"
                                              : eventController.events[index]
                                                  .paket.first.deskripsi,
                                          amount: formatAngka.convertToIdr(
                                              int.parse(eventController
                                                  .events[index].totalPembayaran
                                                  .toString()),
                                              2),
                                        ),
                                      );
                                    },
                                    itemCount: eventController.events.length,
                                  )
                                : Text("Belum ada pembayaran")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
