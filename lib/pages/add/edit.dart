// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/chiqim_model.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:my_wallet_sqflite/pages/home/home_view_model.dart';

class EditKirimChiqim extends StatelessWidget {
  final KirimModel? kirimModel;
  final ChiqimModel? chiqimModel;

  const EditKirimChiqim({
    super.key,
    this.kirimModel,
    this.chiqimModel,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController priceCtrl = TextEditingController();
    priceCtrl.text = kirimModel.isNull ? chiqimModel!.narx! : kirimModel!.narx!;
    titleCtrl.text = (kirimModel.isNull ? chiqimModel!.izoh : kirimModel!.izoh!)!;
    HomeViewModel model = Get.put(HomeViewModel());
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    var date = formatter.format(
      DateTime.now(),
    );
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: priceCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            "Bekor qilish",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(

                      onTap: () {
                        kirimModel.isNull
                            ? model.updateChiqim(
                                ChiqimModel(
                                  id: chiqimModel!.id,

                                  narx: priceCtrl.text,
                                  izoh: titleCtrl.text,
                                  sana: DateTime.parse(date),
                                ),
                              )
                            : model.updateKirim(
                                KirimModel(
                                  id: kirimModel!.id,
                                  narx: priceCtrl.text,
                                  izoh: titleCtrl.text,
                                  sana: DateTime.parse(date),
                                ),
                              );
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Saqlash",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
