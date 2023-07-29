// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unused_element

import 'package:get/get.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/chiqim_model.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:my_wallet_sqflite/data/service/service.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getKirim();
    fetchSummary();
  }

  var isLoading = false.obs;
  var kirimList = [].obs;
  var chiqimList = [].obs;

  var kirimSum = ''.obs;
  var chiqimSum = ''.obs;
  var jamiSum = ''.obs;

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
  updateKirim(KirimModel kirimModel) async {
    changeLoading();
    await LocalDataBases().updateKirim(kirimModel);
    changeLoading();
    getKirim();
    Get.back();
  }

  getChiqim() async {
    changeLoading();
    chiqimList.value = await LocalDataBases().getAllChiqim();
    print(chiqimList);
    changeLoading();
  }

  //
  deleteChiqim(int id) async {
    changeLoading();
    await LocalDataBases().deletechiqim(id);
    getChiqim();
    changeLoading();
  }

  //
  updateChiqim(ChiqimModel chiqimModel) async {
    changeLoading();
    await LocalDataBases().updateChiqim(chiqimModel);
    changeLoading();
    getChiqim();
    Get.back();
  }

  // Future<void> fetchSummary() async {
  //   isLoading.value = true;
  //
  //   try {
  //     var summaryData = await LocalDataBases().fetchSummary();
  //     kirimSum.value = summaryData['kirim'];
  //     chiqimSum.value = summaryData['chiqim'];
  //     jamiSum.value = summaryData['jami'];
  //
  //
  //     print(kirimSum.value);
  //     print(chiqimSum.value);
  //     print(jamiSum.value);
  //   } catch (e) {
  //     print("Error while fetching summary: $e");
  //     Get.snackbar('Error', 'Failed to fetch summary data.');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> fetchSummary() async {
    isLoading.value = true;

    try {
      var summaryData = await LocalDataBases().fetchSummary();
      kirimSum.value = summaryData['kirim'];
      chiqimSum.value = summaryData['chiqim'];
      jamiSum.value = summaryData['jami'];

      print(kirimSum.value);
      print(chiqimSum.value);
      print(jamiSum.value);
    } catch (e) {
      print("Error while fetching summary: $e");
      Get.snackbar('Error', 'Failed to fetch summary data.');
    } finally {
      isLoading.value = false;
    }
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
  }

  String _removeNonNumericChars(String value) {
    return value.replaceAll(
        ',', ''); // Remove commas or any other non-numeric characters
  }
}
