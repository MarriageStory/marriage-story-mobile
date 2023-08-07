import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_payment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/card_transaction.dart';
import '../../../widgets/event_pack.dart';
import '../../events/controllers/event_controller.dart';
import '../../home/home.dart';
import '../payment.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/utils/format_angka.dart';

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
                                    eventController.events.isEmpty
                                        ? IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add_rounded,
                                              color: Colors.transparent,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () =>
                                                controller.formAddTransaction(),
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
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        FormatAngka.convertToIdr(
                                            int.parse(
                                                eventController.events.isEmpty
                                                    ? "0"
                                                    : eventController.events
                                                        .first.totalPembayaran
                                                        .toString()),
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
                      margin: EdgeInsets.only(top: 32.h),
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
                        child: eventController.events.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/empty.png",
                                      height: 50.w,
                                    ),
                                    Center(
                                      child: Text(
                                        "Masukan Kode Terlebih Dahulu",
                                        style: fontNunito.copyWith(
                                          color: colorBlack,
                                          fontWeight: semiBold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pernikahan ${eventController.events.first.namaClient}",
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
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(0),
                                            itemCount: eventController
                                                .events.first.paket.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 3,
                                            ),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var paket = eventController
                                                  .events.first.paket[index];
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
                                      borderRadius: BorderRadius.circular(
                                          defaultBorderRadius),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3.h, horizontal: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: fontNunito.copyWith(
                                                    color: colorPrimary,
                                                    fontWeight: medium,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  controller.payments.length
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: fontNunito.copyWith(
                                                    color: colorPrimary,
                                                    fontWeight: bold,
                                                    fontSize: 18,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: fontNunito.copyWith(
                                                    color: colorPrimary,
                                                    fontWeight: medium,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: FittedBox(
                                                  fit: BoxFit.none,
                                                  child: Text(
                                                    FormatAngka.convertToIdr(
                                                        int.parse(
                                                            eventController
                                                                .events
                                                                .first
                                                                .jumlahTerbayar
                                                                .toString()),
                                                        2),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: fontNunito.copyWith(
                                                      color: colorPrimary,
                                                      fontWeight: bold,
                                                      fontSize: 18,
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
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    "Semua Transaksi",
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorGrey,
                                      fontWeight: medium,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  controller.payments.isNotEmpty
                                      ? ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.all(0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: CardTransaction(
                                                onTap: (() {
                                                  Get.toNamed(
                                                      RouteName.transaction,
                                                      arguments: controller
                                                          .payments[index]);
                                                }),
                                                label: controller
                                                    .payments[index]
                                                    .namaPayment,
                                                date: DateFormat('dd MMM yyyy')
                                                    .format(controller
                                                        .payments[index]
                                                        .datetime)
                                                    .toString(),
                                                amount:
                                                    FormatAngka.convertToIdr(
                                                        int.parse(controller
                                                            .payments[index]
                                                            .total
                                                            .toString()),
                                                        2),
                                              ),
                                            );
                                          },
                                          itemCount: controller.payments.length,
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(
                                              defaultPadding),
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
                                eventController.events.length.toString(),
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
                            eventController.events.isNotEmpty
                                ? ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                                          date: DateFormat('dd MMMM yyyy')
                                              .format(eventController
                                                  .events[index].datetime),
                                          eventPack: FittedBox(
                                            fit: BoxFit.fill,
                                            child: SizedBox(
                                              width: 70.w,
                                              child: GridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.all(0),
                                                itemCount: eventController
                                                    .events[index].paket.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 5.0,
                                                  mainAxisSpacing: 5.0,
                                                  childAspectRatio: 3.2,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index2) {
                                                  return EventPack(
                                                    label: eventController
                                                        .events[index]
                                                        .paket[index2]
                                                        .deskripsi,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          amount: FormatAngka.convertToIdr(
                                              int.parse(eventController
                                                  .events[index].totalPembayaran
                                                  .toString()),
                                              2),
                                        ),
                                      );
                                    },
                                    itemCount: eventController.events.length,
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/empty.png",
                                          height: 50.w,
                                        ),
                                        Center(
                                          child: Text(
                                            "Pembayaran Kosong",
                                            style: fontNunito.copyWith(
                                              color: colorBlack,
                                              fontWeight: semiBold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
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
