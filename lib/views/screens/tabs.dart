import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/controller/providers/filters_provider.dart';
import 'package:meals_app/views/screens/categories.dart';
import 'package:meals_app/views/screens/filters.dart';
import 'package:meals_app/views/screens/meals.dart';
import 'package:meals_app/views/widgets/main_drawer.dart';
import 'package:meals_app/controller/providers/favorites_provider.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

//! ///////////// Widget Bottom Navigation Bar Class ///////////////////
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

//! ///////////// State Bottom Navigation Bar Class ///////////////////
class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifire) async {
    Navigator.of(context).pop();
    if (identifire == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filtredMealProvide);
    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    String titlePage = "Categories";
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      titlePage = "Faivorite";
    }
    return Scaffold(
      appBar: AppBar(title: Text(titlePage)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Your Favorites',
          ),
        ],
      ),
    );
  }
}
