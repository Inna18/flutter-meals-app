import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, required this.onSelectMeal, super.key});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String fixText(String enumText) {
    return enumText[0].toUpperCase() + enumText.substring(1);
  }
 
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                icon: Icons.timer,
                                label: '${meal.duration} min'),
                            const SizedBox(width: 12),
                            MealItemTrait(
                                icon: Icons.work,
                                label: fixText(meal.complexity.name)),
                            const SizedBox(width: 12),
                            MealItemTrait(
                                icon: Icons.money,
                                label: fixText(meal.affordability.name))
                          ],
                        ),
                        const SizedBox(height: 8)
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
