import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/premium_access_controller.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class PremiumAccess extends StatefulWidget {
  PremiumAccess({super.key});

  @override
  State<PremiumAccess> createState() => _PremiumAccessState();
}

class _PremiumAccessState extends State<PremiumAccess> {
  final controller = Get.put(PremiumAccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.h.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.clear_outlined,
                color: AppColors.black(context),
              ),
            ),
          ),
          2.h.height,
          Center(
            child: Icon(
              Icons.workspace_premium,
              size: 45.sp,
              color: AppColors.grey(context),
            ),
          ),
          2.h.height,
          Center(
            child: CustomTextWidget(
              title: context.tr(LocaleKeys.premium_access),
              color: AppColors.black(context),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          0.5.h.height,
          Center(
            child: CustomTextWidget(
              title: context.tr(
                  LocaleKeys.now_enjoy_uninterrupted_and_ad_free_experience),
              color: AppColors.grey(context),
              fontSize: 15.sp,
            ),
          ),
          8.h.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
            child: CustomTextWidget(
              title: context.tr(LocaleKeys.choose_your_plan),
              color: AppColors.black(context),
            ),
          ),
          2.h.height,
          SizedBox(
            height: 27.h,
            child: ListView.builder(
              itemCount: controller.premiumList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(
                  () => CustomContainer(
                    fun: () {
                      controller.choosePlan.value = index;
                    },
                    margin: const EdgeInsets.only(left: 10),
                    height: 30.h,
                    width: 55.w,
                    cir: 10,
                    borders:
                        controller.choosePlan.value == index ? true : false,
                    col: AppColors.offBlack(context),
                    borderCol: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                          ),
                          controller.choosePlan.value == index
                              ? const Icon(
                                  Icons.radio_button_checked_rounded,
                                  color: AppColors.primaryColor,
                                )
                              : const Icon(
                                  Icons.radio_button_off_outlined,
                                  color: AppColors.grayColor,
                                ),
                          Center(
                            child: Column(
                              children: [
                                CustomTextWidget(
                                  title: context
                                      .tr(controller.premiumList[index].month),
                                  fontSize: 16.sp,
                                  color: AppColors.black(context),
                                ),
                                3.h.height,
                                CustomTextWidget(
                                  title: context
                                      .tr(controller.premiumList[index].price),
                                  fontSize: 20.sp,
                                  color: AppColors.black(context),
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  title: context.tr(
                                      controller.premiumList[index].subtitle),
                                  fontSize: 15.sp,
                                  color: AppColors.black(context),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Gradient button

            GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  height: 6.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const CustomTextWidget(
                    title: 'Continue',
                    color: Colors.white,
                  )),
            ),

            SizedBox(height: 10),
            // Restore purchases text
            TextButton(
              onPressed: () {},
              child: Text(
                context.tr(LocaleKeys.restore_purchases),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
