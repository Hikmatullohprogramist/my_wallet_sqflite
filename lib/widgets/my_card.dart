import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String cardName;
  final num balance;
  final int expariedYear;
  final int expariedMonth;
  final int cardNumber;

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
  });

  @override
  Widget build(BuildContext context) {
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
              ).format(balance)}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            const Row(
              children: [
                Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                  size: 15,
                ),
                Text(
                  "200 000 UZS",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_upward,
                  color: Colors.red,
                  size: 15,
                ),
                Text("150 000 UZS", style: TextStyle(color: Colors.white)),
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
