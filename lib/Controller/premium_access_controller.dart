import 'package:get/get.dart';
import 'package:remote_tv/localization/codegen_loader.g.dart';

class PremiumAccessController extends GetxController {
  RxInt choosePlan = 0.obs;

  List<PremiumAccessModel> premiumList = [
    PremiumAccessModel(
        month: '3 ${LocaleKeys.months}',
        price: 'Rs 1,150.00',
        subtitle: LocaleKeys.billed_every_3_months_until_cancelled),
    PremiumAccessModel(
        month: '6 ${LocaleKeys.months}',
        price: 'Rs 1,170.00',
        subtitle: LocaleKeys.billed_every_6_months_until_cancelled),
    PremiumAccessModel(
        month: '12 ${LocaleKeys.months}',
        price: 'Rs 2,650.00',
        subtitle: LocaleKeys.billed_every_12_months_until_cancelled),
    PremiumAccessModel(
        month: LocaleKeys.life_time,
        price: 'Rs 5,500.00',
        subtitle: LocaleKeys.one_time_payment)
  ];
}

class PremiumAccessModel {
  String month;
  String price;
  String subtitle;

  PremiumAccessModel(
      {required this.month, required this.price, required this.subtitle});
}
