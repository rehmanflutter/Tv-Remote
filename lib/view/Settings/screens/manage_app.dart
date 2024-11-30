import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ManageApp extends StatefulWidget {
  ManageApp({super.key});

  @override
  State<ManageApp> createState() => _ManageAppState();
}

class _ManageAppState extends State<ManageApp> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor(context),
        title: CustomTextWidget(
          title: context.tr(LocaleKeys.manage_applications),
          color: AppColors.black(context),
          fontSize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            3.h.height,
            CustomTextWidget(
              title: context.tr(LocaleKeys.recommendations),
              color: AppColors.black(context),
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
            ),
            CustomTextWidget(
              title: context.tr(
                  LocaleKeys.frequently_used_apps_are_shown_as_recommendations),
              color: AppColors.grayColor,
              fontSize: 14.sp,
            ),
            4.h.height,
            Center(
              child: CustomTextWidget(
                title: context.tr(LocaleKeys.no_recommendations_to_show),
                color: AppColors.grayColor,
              ),
            ),
            5.h.height,
            CustomTextWidget(
              title: context.tr(LocaleKeys.default_apps),
              color: AppColors.black(context),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
            2.h.height,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.addApplications.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  mainAxisExtent: 15.h),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomContainer(
                      fun: () {
                        showPopUp(context, index);
                      },
                      height: 7.h,
                      width: 7.h,
                      cir: 5,
                      //   col: Colors.amber,
                      imageDecoration: DecorationImage(
                          image: AssetImage(
                              controller.addApplications[index].logo),
                          fit: BoxFit.fill),
                    ),
                    1.h.height,
                    Center(
                      child: CustomTextWidget(
                        textAlign: TextAlign.center,
                        title: context.tr(
                          controller.addApplications[index].name,
                        ),
                        color: AppColors.black(context),
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void showPopUp(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.backgroundColor(context),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              2.h.height,
              CustomTextWidget(
                title: context.tr(LocaleKeys.add_this_application),
                color: AppColors.black(context),
              ),
              3.h.height,
              CustomContainer(
                height: 7.h,
                width: 7.h,
                cir: 5,
                //   col: Colors.amber,
                imageDecoration: DecorationImage(
                    image: AssetImage(controller.addApplications[index].logo),
                    fit: BoxFit.fill),
              ),
              1.h.height,
              Center(
                child: CustomTextWidget(
                  textAlign: TextAlign.center,
                  title: context.tr(
                    controller.addApplications[index].name,
                  ),
                  color: AppColors.black(context),
                  fontSize: 14.sp,
                ),
              ),
              2.h.height,
              Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.grayColor,
                  ),
                  1.w.width,
                  Container(
                    width: 60.w,
                    //   color: Colors.amber,
                    child: CustomTextWidget(
                      fontSize: 14.sp,
                      title: context.tr(LocaleKeys
                          .you_can_tap_the_above_icon_to_launch_the_application_on_your_television),
                      color: AppColors.grayColor,
                    ),
                  )
                ],
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                context.tr(LocaleKeys.cancel),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                var itemToRemove = controller.addApplications[index];
                controller.addApplications.removeAt(index);

                // Add the removed item to the new list (addApplications)
                controller.applications.add(itemToRemove);
                Navigator.pop(context);
                setState(() {});
              },
              child: Text(
                context.tr(LocaleKeys.add),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            2.h.height,
          ],
        );
      },
    );
  }
}
