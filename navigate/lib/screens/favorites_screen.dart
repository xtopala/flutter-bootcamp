import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, i) {
        Meal meal = favoriteMeals[i];
        return MealItem(
          id: meal.id,
          title: meal.title,
          duration: meal.duration,
          imageUrl: meal.imageUrl,
          affordability: meal.affordability,
          complexity: meal.complexity,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
