import 'package:flutter/material.dart';

import 'package:meals_app/models/category.dart';

//! ///////////// Category Grid Item Class ////////////////
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.selectedMeal,
  });

  final void Function() selectedMeal;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedMeal,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha(130),
              category.color.withAlpha(220),
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
