import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/app_images.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';
import 'package:remote_tv/model/application_model.dart';
import 'package:vibration/vibration.dart';

class HomeController extends GetxController {
//  RemoteLayout   Control
  RxInt navigation = 0.obs;
  RxBool hapticFeedback = false.obs;
  RxBool smoothPress = false.obs;

  RxInt quick_access = 0.obs;

  List<ApplicationModel> quickList = [
    ApplicationModel(
        logo: LocaleKeys.easily_open_applications_installed_on_your_television,
        name: LocaleKeys.application),
    ApplicationModel(
        logo: LocaleKeys.red_green_yellow_and_blue_buttons,
        name: LocaleKeys.colored_buttons),
    ApplicationModel(
        logo: LocaleKeys
            .media_previous_rewind_play_pause_fast_forward_and_next_buttons,
        name: LocaleKeys.media_buttons),
    ApplicationModel(
        logo: LocaleKeys.size_of_navigation_will_increase,
        name: LocaleKeys.none)
  ];

//

  final pageController = PageController();
  var applications = <ApplicationModel>[
    ApplicationModel(logo: AppImages.netflix, name: LocaleKeys.netflix),
    ApplicationModel(logo: AppImages.youtube, name: LocaleKeys.you_tube),
    ApplicationModel(logo: AppImages.prime_video, name: LocaleKeys.prime_video),
    ApplicationModel(logo: AppImages.disnep, name: LocaleKeys.disney),
    ApplicationModel(logo: AppImages.apple_tv, name: LocaleKeys.app_name),
    ApplicationModel(logo: AppImages.max, name: LocaleKeys.max),
  ].obs;
  var addApplications = <ApplicationModel>[].obs;

  List<IconData> buttonIcons = [
    Icons.keyboard,
    Icons.home,
    Icons.gamepad,
    Icons.volume_up,
    Icons.mic,
    Icons.subdirectory_arrow_left_outlined
  ];

  List<Color> colorList = [
    AppColors.red,
    AppColors.green,
    AppColors.yello,
    AppColors.blue
  ];

  //    Vibration Function
  void vibrate() async {
    if (hapticFeedback.value == true) {
      Vibration.vibrate(duration: 70);
    }
  }
}
