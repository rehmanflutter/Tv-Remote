import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ColorList extends StatelessWidget {
  ColorList({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      //color: Colors.amber,
      child: ListView.builder(
        itemCount: controller.colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomContainer(
                    height: 2.h,
                    width: 20.w,
                    cir: 10,
                    col: controller.colorList[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
