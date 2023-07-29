import 'package:get/get.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:my_wallet_sqflite/data/service/service.dart';
import 'package:my_wallet_sqflite/pages/home/home_page.dart';

class KirimChiqimViewModel extends GetxController {
  var isLoading = false.obs;

  addKirim(KirimModel kirimModel) async {
    changeLoading();
    LocalDataBases().addKirim(
      KirimModel(
        id: kirimModel.id,
        narx: kirimModel.narx,
        izoh: kirimModel.izoh,
        sana: kirimModel.sana,
      ),
    );
    changeLoading();
    Get.offAll(const HomePage());
  }

  //
  // addChiqim(String title, String price) async {
  //   changeLoading();
  //   ApiService().addChiqim(title, price);
  //   changeLoading();
  //   Get.offAll(const HomePage());
  // }

  changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
