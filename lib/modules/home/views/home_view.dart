import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/modules/events/controllers/event_controller.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/card_event_home.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:marriage_story_mobile/widgets/event_pack.dart';
import 'package:marriage_story_mobile/widgets/input_form.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController controller = Get.find();
  final EventController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: colorPrimary,
                  size: 7.h,
                ),
              )
            : controller.user.value.roleName == "WeddingOrganize"
                ? SingleChildScrollView(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 20.h,
                          decoration: BoxDecoration(gradient: colorGradient),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: defaultPadding,
                              left: defaultPadding,
                              top: 6.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hallo,",
                                      style: fontNunito.copyWith(
                                        color: colorWhite,
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        controller.user.value.name ?? "-",
                                        style: fontNunito.copyWith(
                                          color: colorWhite,
                                          fontWeight: bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/user-profile.png",
                                  height: 13.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 17.h),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: colorPrimary,
                                          borderRadius: BorderRadius.circular(
                                              defaultBorderRadius),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(25),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Pernikahan",
                                                style: fontNunito.copyWith(
                                                  color: colorWhite,
                                                  fontWeight: medium,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Obx(
                                                () => Text(
                                                  eventController.events.length
                                                      .toString(),
                                                  style: fontNunito.copyWith(
                                                    color: colorWhite,
                                                    fontWeight: semiBold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pernikahan.png",
                                                    width: 16.w,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: colorSecondary,
                                          borderRadius: BorderRadius.circular(
                                              defaultBorderRadius),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(25),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Kegiatan",
                                                style: fontNunito.copyWith(
                                                  color: colorWhite,
                                                  fontWeight: medium,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "10",
                                                style: fontNunito.copyWith(
                                                  color: colorWhite,
                                                  fontWeight: semiBold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/kegiatan.png",
                                                    width: 16.w,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  "Semua Acara",
                                  style: fontNunito.copyWith(
                                    color: colorBlack,
                                    fontWeight: semiBold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Obx(() => eventController.events.isNotEmpty? SizedBox()
                                    // ? ListView.builder(
                                    //     physics:
                                    //         const NeverScrollableScrollPhysics(),
                                    //     scrollDirection: Axis.vertical,
                                    //     shrinkWrap: true,
                                    //     padding: const EdgeInsets.all(0),
                                    //     itemBuilder:
                                    //         (BuildContext context, int index) {
                                    //       return Container(
                                    //         margin: const EdgeInsets.symmetric(
                                    //             vertical: 5),
                                    //         child: CardEventHome(
                                    //           onTap: () => Get.toNamed(
                                    //               RouteName.detailEvent,
                                    //               arguments:
                                    //                   eventController.events[index]),
                                    //           label: eventController
                                    //               .events[index].nameClient,
                                    //           date: eventController
                                    //               .events[index].date
                                    //               .toString(),
                                    //           task: "2",
                                    //         ),
                                    //       );
                                    //     },
                                    //     itemCount: eventController.events.length,
                                    //   )
                                    : Center(
                                        child: Text(
                                          "Acara Kosong",
                                          style: fontNunito.copyWith(
                                            color: colorWhite,
                                            fontWeight: semiBold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : controller == ""
                    ? SingleChildScrollView(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 55.h,
                              decoration:
                                  BoxDecoration(gradient: colorGradient),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: defaultPadding,
                                  left: defaultPadding,
                                  top: 6.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hallo,",
                                              style: fontNunito.copyWith(
                                                color: colorWhite,
                                                fontWeight: semiBold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                "",
                                                // controller.user.value.name,
                                                style: fontNunito.copyWith(
                                                  color: colorWhite,
                                                  fontWeight: bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/images/user-profile.png",
                                          height: 13.w,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Image.asset(
                                      "assets/images/empty.png",
                                      height: 50.w,
                                    ),
                                    Center(
                                      child: Text(
                                        "Masukan Kode Terlebih Dahulu",
                                        style: fontNunito.copyWith(
                                          color: colorWhite,
                                          fontWeight: semiBold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 50.h),
                              decoration: const BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(defaultBorderRadius2),
                                  topRight:
                                      Radius.circular(defaultBorderRadius2),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: defaultPadding,
                                  left: defaultPadding,
                                  top: 6.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: InputForm(
                                            label: "Masukan Kode",
                                            inputController: controller
                                                .genCodeTextController,
                                          ),
                                        ),
                                        Flexible(
                                          child: Button(
                                            height: 7.h,
                                            width: 16.w,
                                            onTap: () =>
                                                controller.updateGenCode(),
                                            colorBg: colorPrimary,
                                            label: "OK",
                                            textColor: colorWhite,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Acara Kosong",
                                      style: fontNunito.copyWith(
                                        color: colorBlack,
                                        fontWeight: semiBold,
                                        fontSize: 16,
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
                              height: 55.h,
                              decoration:
                                  BoxDecoration(gradient: colorGradient),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: defaultPadding,
                                  left: defaultPadding,
                                  top: 6.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hallo,",
                                              style: fontNunito.copyWith(
                                                color: colorWhite,
                                                fontWeight: semiBold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                // controller.user.value.name ??
                                                    "-",
                                                style: fontNunito.copyWith(
                                                  color: colorWhite,
                                                  fontWeight: bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/images/user-profile.png",
                                          height: 13.w,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/event.png"),
                                          fit: BoxFit.scaleDown,
                                        ),
                                        color: colorWhite.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: colorWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "dec",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: fontNunito
                                                              .copyWith(
                                                            color: colorBlack,
                                                            fontWeight:
                                                                semiBold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "23",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: fontNunito
                                                              .copyWith(
                                                            color: colorPink4,
                                                            fontWeight:
                                                                extraBold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Hbgs",
                                                  style: fontNunito.copyWith(
                                                    color: colorBlack,
                                                    fontWeight: bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        defaultBorderRadius),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 6,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Pernikahan Ainul dan Aan ",
                                                            softWrap: false,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: fontNunito
                                                                .copyWith(
                                                              color: colorBlack,
                                                              fontWeight:
                                                                  semiBold,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          SizedBox(
                                                            width: 50.w,
                                                            child: Wrap(
                                                              spacing: 5.0,
                                                              runSpacing: 5.0,
                                                              direction: Axis
                                                                  .horizontal,
                                                              children: const [
                                                                EventPack(
                                                                    label:
                                                                        "Pre Wedding"),
                                                                EventPack(
                                                                    label:
                                                                        "Akad"),
                                                                EventPack(
                                                                    label:
                                                                        "Akad"),
                                                                EventPack(
                                                                    label:
                                                                        "Akad"),
                                                                EventPack(
                                                                    label:
                                                                        "Akad"),
                                                                EventPack(
                                                                    label:
                                                                        "Akad"),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons
                                                              .arrow_forward_rounded,
                                                          color:
                                                              Colors.blueAccent,
                                                        ),
                                                        alignment: Alignment
                                                            .centerRight,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 50.h),
                              decoration: const BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(defaultBorderRadius2),
                                  topRight:
                                      Radius.circular(defaultBorderRadius2),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: defaultPadding,
                                  left: defaultPadding,
                                  top: 5.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Agenda Selanjutnya",
                                      style: fontNunito.copyWith(
                                        color: colorBlack,
                                        fontWeight: semiBold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CardTask(
                                          onTap: () {},
                                          label: "Meeting dengan Wo",
                                          date: "23 April 2022",
                                          time: "17:00",
                                        ),
                                      ],
                                    ),
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
