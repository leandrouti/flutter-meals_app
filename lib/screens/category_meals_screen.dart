import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> avaiableMeals;

  const CategoryMealsScreen({
    Key? key,
    required this.avaiableMeals,
  }) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? _categoryTitle;
  List<Meal>? _displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    _categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    if (!_loadedInitData) {
      _displayedMeals = widget.avaiableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     _displayedMeals?.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _displayedMeals![index].id,
              title: _displayedMeals![index].title,
              imageUrl: _displayedMeals![index].imageUrl,
              duration: _displayedMeals![index].duration,
              complexity: _displayedMeals![index].complexity,
              affordability: _displayedMeals![index].affordability,
              // removeItem: _removeMeal,
            );
          },
          itemCount: _displayedMeals!.length,
        ),
      ),
    );
  }
}
