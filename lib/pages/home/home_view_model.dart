// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:get/get.dart';
import 'package:my_wallet_sqflite/data/service/service.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getKirim();
  }

  var isLoading = false.obs;
  var kirimList = [].obs;
  var chiqimList = [].obs;

  getKirim() async {
    changeLoading();
    kirimList.value = await LocalDataBases().getAllKirim();
    print(kirimList);
    changeLoading();
  }
  //
  deleteKirim(int id) async {
    changeLoading();
    await LocalDataBases().deleteKirim(id);
    getKirim();
    changeLoading();
  }
  //
  // updateKirim(String title, String price, int id) async {
  //   changeLoading();
  //   await ApiService().updateKirim(title, price, id);
  //   changeLoading();
  //   getKirim();
  //   Get.back();
  // }
  //
  // getChiqim() async {
  //   changeLoading();
  //   chiqimList.value = await ApiService().getChiqim();
  //   print(chiqimList);
  //   changeLoading();
  // }
  //
  // deleteChiqim(int id) {
  //   changeLoading();
  //   ApiService().deleteChiqim(id);
  //   getChiqim();
  //   changeLoading();
  // }

  changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
