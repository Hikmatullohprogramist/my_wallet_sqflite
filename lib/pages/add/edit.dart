import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:my_wallet_sqflite/pages/home/home_view_model.dart';

class EditKirimChiqim extends StatelessWidget {
  final KirimModel kirimModel;

  const EditKirimChiqim({
    super.key,
    required this.kirimModel,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController priceCtrl = TextEditingController();
    priceCtrl.text = kirimModel.izoh!;
    titleCtrl.text = kirimModel.narx.toString();
    HomeViewModel model = Get.put(HomeViewModel());
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
                      onTap: ()=>Get.back(),
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
                        // model.updateKirim(
                        //   kirimModel.izoh!,
                        //   kirimModel.narx.toString(),
                        //   kirimModel.id,
                        // );

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
