import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {required this.meal, required this.onSelectFavourite, super.key});

  final Meal meal;
  final void Function(Meal meal) onSelectFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () => onSelectFavourite(meal),
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text('Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 12),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
            const SizedBox(height: 24),
            Text('Steps',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              )
          ],
        ),
      ),
    );
  }
}
