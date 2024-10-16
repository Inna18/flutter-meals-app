import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/drawer_widget.dart';

final kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Meal> favouriteMeals = [];
  Map<Filter, bool> _currentFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleFavourite(Meal meal) {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (favouriteMeals.contains(meal)) {
      setState(() {
        favouriteMeals.remove(meal);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Meal was removed from Favourites...'),
          duration: Duration(milliseconds: 500),
        ));
      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Meal was added to Favourites!'),
          duration: Duration(milliseconds: 500),
        ));
      });
    }
  }

  void _setMenu(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) =>
                  FiltersScreen(currentFilters: _currentFilters)));

      setState(() {
        _currentFilters = result!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onSelectFavourite: _toggleFavourite,
      currentFilters: _currentFilters,
    );
    String activeTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
          meals: favouriteMeals, onSelectFavourite: _toggleFavourite);
      activeTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      drawer: DrawerWidget(onSetMenu: _setMenu),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) => _selectPage(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ]),
    );
  }
}
