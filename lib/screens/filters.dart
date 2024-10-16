import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluterFreeMealsFilterSet = false;
  var _lactoseFreeMealsFilterSet = false;
  var _vegetarianMealsFilterSet = false;
  var _veganMealsFilterSet = false;

  @override
  void initState() {
    super.initState();

    _gluterFreeMealsFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeMealsFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianMealsFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganMealsFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _gluterFreeMealsFilterSet,
              Filter.lactoseFree: _lactoseFreeMealsFilterSet,
              Filter.vegetarian: _vegetarianMealsFilterSet,
              Filter.vegan: _veganMealsFilterSet,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _gluterFreeMealsFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _gluterFreeMealsFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text('Only gluten-free meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              SwitchListTile(
                value: _lactoseFreeMealsFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeMealsFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text('Only lactose-free meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              SwitchListTile(
                value: _vegetarianMealsFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianMealsFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text('Only vegetarian meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              SwitchListTile(
                value: _veganMealsFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganMealsFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text('Only vegan meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
            ],
          ),
        ));
  }
}
