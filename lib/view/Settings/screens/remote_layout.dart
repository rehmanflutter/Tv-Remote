import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RemoteLayout extends StatelessWidget {
  RemoteLayout({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor(context),
        title: CustomTextWidget(
          title: context.tr(LocaleKeys.settings),
          color: AppColors.black(context),
          fontSize: 18.sp,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                3.h.height,
                CustomTextWidget(
                  fontSize: 17.sp,
                  title: context.tr(LocaleKeys.navigation),
                  color: AppColors.black(context),
                ),
                1.h.height,
                CustomListContainer(
                  onTap: () {
                    controller.navigation.value = 0;
                  },
                  title: LocaleKeys.touchpad,
                  subtitle:
                      LocaleKeys.swipe_based_touchpad_quick_and_convenient,
                  borders: controller.navigation.value == 0 ? true : false,
                  child: CustomContainer(
                    width: 30.w,
                    height: 11.h,
                    cir: 10,
                    col: AppColors.grey(context),
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: 17.sp,
                            color: AppColors.grayColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 17.sp,
                                color: AppColors.grayColor,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 17.sp,
                                color: AppColors.grayColor,
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_downward,
                            size: 17.sp,
                            color: AppColors.grayColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                2.h.height,
                CustomListContainer(
                    onTap: () {
                      controller.navigation.value = 1;
                    },
                    title: LocaleKeys.d_pad,
                    subtitle: LocaleKeys
                        .tap_based_control_as_found_on_physical_remote,
                    borders: controller.navigation.value == 1 ? true : false,
                    child: Container(
                      width: 30.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey(context),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 17.sp,
                              color: AppColors.grayColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 17.sp,
                                  color: AppColors.grayColor,
                                ),
                                Container(
                                  width: 7.w,
                                  height: 7.h,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff353535)),
                                      shape: BoxShape.circle,
                                      color: AppColors.grayColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withOpacity(0.2), // Shadow color
                                          blurRadius:
                                              8.0, // Spread of the shadow
                                          offset: Offset(3, 4),
                                        )
                                      ]),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 17.sp,
                                  color: AppColors.grayColor,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 17.sp,
                              color: AppColors.grayColor,
                            ),
                          ],
                        ),
                      ),
                    )),
                2.h.height,
                CustomTextWidget(
                  fontSize: 17.sp,
                  title: context.tr(LocaleKeys.quick_access),
                  color: AppColors.black(context),
                ),
                1.h.height,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.quickList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Obx(
                        () => CustomListContainer(
                            title: controller.quickList[index].name,
                            subtitle: controller.quickList[index].logo,
                            borders: controller.quick_access.value == index
                                ? true
                                : false,
                            onTap: () {
                              controller.quick_access.value = index;
                            },
                            child: 1.w.width),
                      ),
                    );
                  },
                ),
                3.h.height
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? child;
  final bool borders;
  final VoidCallback onTap;
  CustomListContainer(
      {required this.title,
      required this.subtitle,
      this.child,
      required this.borders,
      required this.onTap});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomContainer(
            fun: onTap,
            width: double.infinity,
            borders: borders == true ? true : false,
            borderCol: AppColors.primaryColor,
            // height: 12.h,
            cir: 8,
            col: AppColors.offBlack(context),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        title: context.tr(title),
                        color: AppColors.black(context),
                        fontSize: 17.sp,
                      ),
                      Container(
                        width: 53.w,
                        // color: Colors.amber,
                        child: CustomTextWidget(
                          title: context.tr(subtitle),
                          color: AppColors.grey(context),
                          fontSize: 14.5.sp,
                        ),
                      ),
                    ],
                  ),
                  child!
                ],
              ),
            )

            // ListTile(
            //   //  isThreeLine: true,
            //   minTileHeight: 11.h,
            //   dense: true,
            //   title: CustomTextWidget(
            //     title: context.tr(LocaleKeys.touchpad),
            //     color: AppColors.black(context),
            //     fontSize: 17.sp,
            //   ),
            //   subtitle: CustomTextWidget(
            //     title: context.tr(
            //         LocaleKeys.swipe_based_touchpad_quick_and_convenient),
            //     color: AppColors.grey(context),
            //     fontSize: 15.sp,
            //   ),
            //   trailing: CustomContainer(
            //     width: 30.w,
            //     height: 11.h,
            //     cir: 6,
            //     col: AppColors.grey(context),
            //   ),
            // ),

            ),
        Positioned(
            right: 10, //context.locale.languageCode == 'ar' ? 0 : 10,
            //left:context.locale.languageCode == 'ar' ? 10 : 0,
            top: 10,
            child: borders == true
                ? const Icon(
                    Icons.radio_button_checked,
                    color: AppColors.primaryColor,
                  )
                : const Icon(
                    Icons.radio_button_off_outlined,
                    color: AppColors.grayColor,
                  )),
      ],
    );
  }
}
