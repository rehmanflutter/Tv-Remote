import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class RemoteBehavior extends StatelessWidget {
  RemoteBehavior({super.key});
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          3.h.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
            child: CustomTextWidget(
              title: context.tr(LocaleKeys.remote_behavior),
              color: AppColors.grayColor,
              fontSize: 16.sp,
            ),
          ),
          3.h.height,
          ListTile(
            title: CustomTextWidget(
              title: context.tr(LocaleKeys.haptic_feedback),
              color: AppColors.black(context),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
            subtitle: CustomTextWidget(
              title: context.tr(LocaleKeys
                  .a_light_vibration_feedback_when_remote_buttons_are_pressed),
              color: AppColors.grayColor,
              fontSize: 15.sp,
            ),
            trailing: Obx(
              () => CupertinoSwitch(
                activeColor: AppColors.primaryColor,
                value: controller.hapticFeedback.value,
                onChanged: (bool value) {
                  controller.hapticFeedback.value = value;
                },
              ),
            ),
          ),
          ListTile(
            title: CustomTextWidget(
              title: context.tr(LocaleKeys.smooth_press),
              color: AppColors.black(context),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
            subtitle: CustomTextWidget(
              title: context.tr(LocaleKeys
                  .try_to_mimic_physical_remote_natural_behavior_when_you_Press_and_Hold_volume_channel_and_navigation_keys),
              color: AppColors.grayColor,
              fontSize: 15.sp,
            ),
            trailing: Obx(
              () => CupertinoSwitch(
                activeColor: AppColors.primaryColor,
                value: controller.smoothPress.value,
                onChanged: (bool value) {
                  controller.smoothPress.value = value;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
