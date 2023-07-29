import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:my_wallet_sqflite/pages/add/add_kirim_chiqim_model.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  KirimChiqimViewModel model = Get.put(KirimChiqimViewModel());

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  bool isSelected_1 = false;
  bool isSelected_2 = false;
  int selected = 0;

  void ontTapped1() {
    setState(() {
      isSelected_1 = true;
      isSelected_2 = false;
      selected = 1;
    });
  }

  void ontTapped2() {
    setState(() {
      isSelected_1 = false;
      isSelected_2 = true;
      selected = 2;
    });
  }


  int uniqueID = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => ontTapped1(),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: isSelected_1
                            ? Colors.transparent
                            : Colors.deepPurple,
                      ),
                      color: isSelected_1 ? Colors.deepPurple : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Kirim",
                        style: TextStyle(
                          color: isSelected_1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => ontTapped2(),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: isSelected_2 ? Colors.transparent : Colors.red,
                      ),
                      color: isSelected_2 ? Colors.red : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Chiqim",
                        style: TextStyle(
                            color: isSelected_2 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: title,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Title")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: price,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
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
                  GestureDetector(
                    onTap: () {
                      DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
                      var date = formatter.format(
                        DateTime.now(),
                      );
                      if (isSelected_1) {

                        model.addKirim(
                          KirimModel(
                            narx: price.text.trim(),
                            izoh: title.text.trim(),
                            sana: DateTime.parse(date),
                          ),
                        );
                      } else {
                        // model.addChiqim(title.text.trim(), price.text.trim());
                      }
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
      ),
    );
  }
}
