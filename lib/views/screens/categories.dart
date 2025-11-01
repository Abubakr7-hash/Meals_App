import 'package:flutter/material.dart';

import 'package:meals_app/models/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/views/screens/meals.dart';
import 'package:meals_app/views/widgets/category_grid_item.dart';

//! //////////////// Categories Screen Class ///////////
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //! ///////////////// Selected Categry Function ///////
  void _selectCategory(BuildContext context, Category category) {
    final filttredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filttredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children:
          //! ///////////////// another Idea for loop //////////////
          // availableCategories
          //     .map((e) => CategoryGridItem(category: e))
          //     .toList(),
          //! //////////////////////////////////////////////////
          [
            for (final categ in availableCategories)
              CategoryGridItem(
                category: categ,
                selectedMeal: () {
                  _selectCategory(context, categ);
                },
              ),
          ],
    );
  }
}
