import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_tv/Routes/app_routes.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            2.h.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    title: context.tr(LocaleKeys.settings),
                    color: AppColors.black(context),
                    fontSize: 20.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear_outlined,
                      color: AppColors.black(context),
                    ),
                  )
                ],
              ),
            ),
            2.h.height,
            Divider(
              color: AppColors.offBlack(context),
            ),
            2.h.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                      title: context.tr(LocaleKeys.remote),
                      fontSize: 17.sp,
                      color: AppColors.grayColor),
                  2.h.height,
                  ListTileWidget(
                    title: LocaleKeys.remote_layout,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.remoteLayout);
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.remote_behavior,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.remoteBehavior);
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.manage_applications,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.manageApplication);
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.connected_devices,
                    onTap: () {},
                  ),
                  ListTileWidget(
                    title: LocaleKeys.language,
                    onTap: () {
                      languageListShow(context);
                    },
                  ),
                  CustomContainer(
                    fun: () {},
                    height: 5.5.h,
                    col: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          title: context.tr(LocaleKeys.theme),
                          fontSize: 16.5.sp,
                          color: AppColors.black(context),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: AppColors.primaryColor,
                            value: AdaptiveTheme.of(context).mode.isDark,
                            onChanged: (bool isDark) {
                              if (isDark) {
                                AdaptiveTheme.of(context).setDark();
                              } else {
                                AdaptiveTheme.of(context).setLight();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.offBlack(context),
            ),
            2.h.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                      title: context.tr(LocaleKeys.application),
                      fontSize: 17.sp,
                      color: AppColors.grayColor),
                  1.h.height,
                  ListTileWidget(
                    title: LocaleKeys.share_wit_friends,
                    iconData: Icons.share,
                    onTap: () async {
                      await Share.share(
                          'Check out this amazing application “Remote for Android TV”! App Store: https://apps.apple.com/us/app/remote-for-android-tv/id1668755298   Google Play: https://play.google.com/store/apps/details?id=tech.simha.androidtvremote');
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.rate_and_review,
                    iconData: Icons.star,
                    onTap: () {
                      _launchUrl(
                          'https://play.google.com/store/apps/details?id=tech.simha.androidtvremote');
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.feedback,
                    iconData: Icons.edit,
                    onTap: () async {
                      _launchMail();
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.legal,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.legalScreen);
                    },
                  ),
                  ListTileWidget(
                    title: LocaleKeys.activate_premium,
                    iconData: Icons.emoji_events,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.premiumAccess);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String enterUrl) async {
    if (!await launchUrl(Uri.parse(enterUrl))) {
      throw Exception('Could not launch ');
    }
  }

  Future<void> _launchMail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'rahman848b@gmail.com',
      query: 'subject=Hello&body=Hi there,',
    );

    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch mail client');
    }
  }

  void languageListShow(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColor(context),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomContainer(
                height: 5,
                width: 100,
                col: Color(0xffdadada),
                cir: 10,
              ),
              2.h.height,
              ListTile(
                onTap: () async {
                  context.setLocale(Locale('en'));
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.language),
                title: CustomTextWidget(
                  title: 'English',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black(context),
                ),
              ),
              Divider(
                color: AppColors.offBlack(context),
                height: 0,
              ),
              ListTile(
                onTap: () async {
                  context.setLocale(Locale('ar'));
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.language),
                title: CustomTextWidget(
                  title: context.tr(LocaleKeys.arabic),
                  fontSize: 18.sp,
                  color: AppColors.black(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              60.height,
            ],
          ),
        );
      },
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;
  ListTileWidget(
      {required this.title,
      this.iconData = Icons.keyboard_arrow_right_sharp,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      fun: onTap,
      height: 5.5.h,
      col: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            title: context.tr(title),
            fontSize: 16.5.sp,
            color: AppColors.black(context),
          ),
          Icon(
            iconData,
            color: AppColors.black(context),
          ),
        ],
      ),
    );
  }
}
