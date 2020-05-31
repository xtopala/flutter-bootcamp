import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;

  // CategoryMealsScreen(this.id, this.title);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            Meal meal = categoryMeals[i];
            return MealItem(
              id: meal.id,
              title: meal.title,
              duration: meal.duration,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
              complexity: meal.complexity,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
