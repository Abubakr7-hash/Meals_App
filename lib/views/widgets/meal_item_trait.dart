import 'package:flutter/material.dart';

//! ///////////// Meal Item Trait Class ////////////////
class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(width: 3),
        Text(lable, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
