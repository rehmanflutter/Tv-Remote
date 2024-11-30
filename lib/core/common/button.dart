import 'package:flutter/material.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';

class TvButton extends StatelessWidget {
  final double height;
  final Widget widget;
  final Color color;
  final Function() onTap;
  final double? elevation;
  final bool? circle; // Determines whether the button is circular or not

  TvButton({
    Key? key,
    required this.height,
    required this.widget,
    required this.color,
    required this.onTap,
    this.elevation,
    this.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: AppColors.offwhite(context),
      elevation: elevation ?? 0,
      shape: circle == true
          ? const CircleBorder(
              side: BorderSide(color: Colors.transparent, width: 2),
            )
          : RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.offBlack(context),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
      color: color,
      minWidth: 200,
      height: height,
      onPressed: () {
        onTap();
      },
      child: widget,
    );
  }
}
