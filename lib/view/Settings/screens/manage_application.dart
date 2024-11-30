import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/Routes/app_routes.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ManageApplication extends StatefulWidget {
  const ManageApplication({super.key});

  @override
  State<ManageApplication> createState() => _ManageApplicationState();
}

class _ManageApplicationState extends State<ManageApplication> {
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
          fontSize: 15.spa,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
        child: Column(
          children: [
            2.h.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  title: context.tr(LocaleKeys.manage_applications),
                  color: AppColors.grayColor,
                  fontSize: 16.sp,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.manageApp);
                      },
                      child: const Icon(
                        Icons.add_circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    1.w.width,
                    GestureDetector(
                        onTap: () {
                          _showPopupMenu(context);
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: AppColors.black(context),
                        ))
                  ],
                )
              ],
            ),
            2.h.height,
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.applications.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomContainer(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        height: 6.h,
                        cir: 8,
                        col: AppColors.offBlack(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomTextWidget(
                                    title: '=',
                                    fontSize: 20.sp,
                                    color: AppColors.black(context),
                                  ),
                                  4.w.width,
                                  CustomContainer(
                                    height: 4.h,
                                    width: 4.h,
                                    cir: 5,
                                    //  col: Colors.amber,
                                    imageDecoration: DecorationImage(
                                      image: AssetImage(
                                          controller.applications[index].logo),
                                    ),
                                  ),
                                  2.w.width,
                                  CustomTextWidget(
                                    title: context.tr(
                                        controller.applications[index].name),
                                    fontSize: 15.sp,
                                    color: AppColors.black(context),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  // controller.applications.removeAt(index);

                                  // controller.addApplications.add(
                                  //   ApplicationModel(
                                  //       logo: controller.applications[index].logo,
                                  //       name:
                                  //           controller.applications[index].name),
                                  // );
                                  var itemToRemove =
                                      controller.applications[index];
                                  controller.applications.removeAt(index);

                                  // Add the removed item to the new list (addApplications)
                                  controller.addApplications.add(itemToRemove);
                                },
                                child: const Icon(
                                  Icons.cancel_sharp,
                                  color: AppColors.red,
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showMenu(
      color: AppColors.backgroundColor(context),
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 50, 100),
      items: [
        const PopupMenuItem<String>(
          value: 'Edit',
          child: const Text('Reset'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      controller.applications.addAll(controller.addApplications);
      controller.addApplications.clear();
    });
  }
}
