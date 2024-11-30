import 'package:flutter/material.dart';
import 'package:remote_tv/core/Extension/extension.dart';
import 'package:remote_tv/core/common/app_text.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.sidesPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            2.h.height,
            CustomTextWidget(
              title: LocaleKeys.legal,
              color: AppColors.grey(context),
            ),
            3.h.height,
            ListTile(
              onTap: () {
                _launchUrl(
                    'https://www.simha.tech/privacy-policy-remote-for-android-tv');
              },
              contentPadding: EdgeInsets.all(0),
              title: CustomTextWidget(
                title: context.tr(LocaleKeys.privacy_policy),
                color: AppColors.black(context),
                fontSize: 16.5.sp,
              ),
              trailing: Icon(
                Icons.privacy_tip,
                color: AppColors.black(context),
              ),
            ),
            ListTile(
              onTap: () {
                _launchUrl(
                    'https://www.simha.tech/terms-of-use-remote-for-android-tv');
              },
              contentPadding: EdgeInsets.all(0),
              title: CustomTextWidget(
                title: context.tr(LocaleKeys.terms),
                color: AppColors.black(context),
                fontSize: 16.5.sp,
              ),
              trailing: Icon(
                Icons.terminal_sharp,
                color: AppColors.black(context),
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
}
