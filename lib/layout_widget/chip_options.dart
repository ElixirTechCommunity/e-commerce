import 'package:flutter/material.dart';

class SlidingChipOption extends StatelessWidget {
  final String chipName;

  const SlidingChipOption({super.key, required this.chipName});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        chipName,
        style: const TextStyle(fontSize: 15),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      surfaceTintColor: const Color.fromARGB(255, 202, 142, 160),
      backgroundColor: const Color.fromARGB(255, 202, 142, 160),
    );
  }
}

List<String> items = ["All","Grocery","Appliances", "Clothes", "Shoes", "Cosmetics"];
