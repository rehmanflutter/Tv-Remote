import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ApplicationList extends StatelessWidget {
  ApplicationList({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      //  color: Colors.amber,
      child: ListView.builder(
        itemCount: controller.applications.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomContainer(
                  height: 7.h,
                  width: 7.h,
                  cir: 5,
                  //   col: Colors.amber,
                  imageDecoration: DecorationImage(
                      image: AssetImage(controller.applications[index].logo),
                      fit: BoxFit.fill),
                ),
                1.h.height,
                Center(
                  child: SizedBox(
                    width: 13.w,
                    // color: Colors.amber,
                    child: CustomTextWidget(
                      textAlign: TextAlign.center,
                      title: context.tr(
                        controller.applications[index].name,
                      ),
                      color: AppColors.black(context),
                      fontSize: 14.sp,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
