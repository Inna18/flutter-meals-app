import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onSelectFavourite,
      required this.currentFilters});

  final void Function(Meal meal) onSelectFavourite;
  final Map<Filter, bool> currentFilters;

  void _selectCategory(BuildContext context, Category category) {
    var filterMeals = dummyMeals.where((meal) {
      if (currentFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (currentFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (currentFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (currentFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();

    final filteredMeals = filterMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredMeals,
                  onSelectFavourite: onSelectFavourite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20),
            children: availableCategories
                .map((category) => CategoryItem(
                    category: category,
                    onSelectCategory: () => _selectCategory(context, category)))
                .toList()));
  }
}
