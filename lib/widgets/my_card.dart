// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String cardName;
  final String balance;
  final int expariedYear;
  final int expariedMonth;
  final int cardNumber;
  final String kirim;
  final String chiqim;

  // ignore: prefer_typing_uninitialized_variables
  final color;

  const MyCard({
    super.key,
    required this.balance,
    required this.expariedYear,
    required this.expariedMonth,
    required this.cardNumber,
    required this.color,
    required this.cardName,
    required this.kirim,
    required this.chiqim,
  });

  @override
  Widget build(BuildContext context) {
    double balanceValue = double.tryParse(balance) ?? 0.0;
    bool isBalanceNegative = balanceValue < 0;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              cardName,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              " ${NumberFormat.currency(
                locale: "Uz-uz",
                decimalDigits: 1,
              ).format(balanceValue)}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                  size: 15,
                ),
                Text(
                  "$kirim",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.red,
                  size: 15,
                ),
                Text(
                    "$chiqim",
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$cardNumber",
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "$expariedYear/$expariedMonth",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
