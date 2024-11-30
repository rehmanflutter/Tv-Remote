import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/Routes/app_routes.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/button.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:remote_tv/view/Home/widget/application_list.dart';
import 'package:remote_tv/view/Home/widget/color_list.dart';
import 'package:remote_tv/view/Home/widget/media_button.dart';
import 'package:remote_tv/view/Home/widget/remote_ketboard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [
            //  7.h.height,
            2.h.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.settingScreen);
                    },
                    child: Icon(
                      Icons.settings,
                      color: AppColors.black(context),
                    ),
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        title: context.tr(LocaleKeys.choose_a_tv),
                        color: AppColors.black(context),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.black(context),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.power_settings_new,
                    color: AppColors.red,
                  )
                ],
              ),
            ),
            4.h.height,
            Obx(() => controller.quick_access.value == 0
                ? ApplicationList()
                : controller.quick_access.value == 1
                    ? ColorList()
                    : controller.quick_access.value == 2
                        ? MediaButton()
                        : SizedBox(
                            height: 4.h,
                          )),

            Obx(
              () => Container(
                //color: Colors.amber,
                height: controller.quick_access.value == 1 ||
                        controller.quick_access.value == 3
                    ? 40.h
                    : 33.h,
                child: PageView.builder(
                  itemCount: 2,
                  controller: controller.pageController,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? RemoteKetboard()
                        : GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 12,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 15.0,
                                    crossAxisSpacing: 15.0,
                                    mainAxisExtent:
                                        controller.quick_access.value == 1 ||
                                                controller.quick_access.value ==
                                                    3
                                            ? 7.5.h
                                            : 6.5.h),
                            itemBuilder: (context, index) {
                              return TvButton(
                                  onTap: () {
                                    controller.vibrate();
                                  },
                                  height: 6.5.h,
                                  widget: CustomTextWidget(
                                    title: index == 9
                                        ? context.tr(LocaleKeys.tv)
                                        : index == 10
                                            ? '0'
                                            : index == 11
                                                ? context.tr(LocaleKeys.menu)
                                                : '${index + 1}',
                                    color: AppColors.black(context),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                  ),
                                  color: index == 9 || index == 11
                                      ? Colors.transparent
                                      : AppColors.offBlack(context));
                            },
                          );
                  },
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: controller.pageController,
              count: 2,
              axisDirection: Axis.horizontal,
              effect: const JumpingDotEffect(
                  spacing: 8.0,
                  radius: 10.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.primaryColor),
            ),
            1.h.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                    width: 15.w,
                    height: 25.h,
                    cir: 25.sp,
                    col: AppColors.offBlack(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TvButton(
                          height: 8.h,
                          circle: true,
                          widget: Icon(
                            Icons.add,
                            color: AppColors.black(context),
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            controller.vibrate();
                          },
                        ),
                        CustomTextWidget(
                          title: 'VoL',
                          color: AppColors.black(context),
                        ),
                        TvButton(
                          height: 8.h,
                          circle: true,
                          widget: Icon(
                            Icons.remove,
                            color: AppColors.black(context),
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            controller.vibrate();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25.h,
                    width: 57.w,
                    // color: Colors.amber,
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.buttonIcons.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          mainAxisExtent: 12.h),
                      itemBuilder: (context, index) {
                        return TvButton(
                            onTap: () {
                              controller.vibrate();
                            },
                            height: 10.h,
                            circle: true,
                            widget: Icon(
                              controller.buttonIcons[index],
                              color: AppColors.black(context),
                            ),
                            color: AppColors.offBlack(context));
                      },
                    ),
                  ),
                  CustomContainer(
                    width: 15.w,
                    height: 25.h,
                    cir: 25.sp,
                    col: AppColors.offBlack(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TvButton(
                          height: 8.h,
                          circle: true,
                          widget: Icon(
                            Icons.keyboard_arrow_up,
                            color: AppColors.black(context),
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            controller.vibrate();
                          },
                        ),
                        CustomTextWidget(
                          title: 'CH',
                          color: AppColors.black(context),
                        ),
                        TvButton(
                          height: 8.h,
                          circle: true,
                          widget: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.black(context),
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            controller.vibrate();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
