import 'package:flutter/material.dart';
import 'package:remote_tv/core/common/button.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MediaButton extends StatelessWidget {
  MediaButton({super.key});

  List<IconData> mediaList = [
    Icons.first_page,
    Icons.fast_rewind,
    Icons.play_arrow,
    Icons.fast_forward,
    Icons.last_page
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //   color: Colors.red,

      height: 14.h,
      child: ListView.builder(
        itemCount: mediaList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                width: 16.w,
                //   color: Colors.red,
                child: TvButton(
                  circle: true,
                  height: 8.h,
                  widget: Icon(mediaList[index]),
                  color: AppColors.offBlack(context),
                  onTap: () {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
