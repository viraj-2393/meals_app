import 'package:flutter/material.dart';
import 'package:meals_app/meal_item.dart';
import './models/meal.dart';
class CategoryMealsScreen extends StatefulWidget{
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  State<StatefulWidget> createState() {
    return CategoryMealsScreenState();
  }
}
class CategoryMealsScreenState extends State<CategoryMealsScreen>{
  late String categoryTitle;
  late List<Meal> displayMeals;

  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies(){
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }
  void _removeMeal(String mealId){
     setState(() {
       displayMeals.removeWhere((meal) => meal.id == mealId);
     });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body:Center(
        child: ListView.builder(
          itemBuilder: (ctx,index){
            return MealItem(
                id: displayMeals[index].id,
                title: displayMeals[index].title,
                imageUrl: displayMeals[index].imageUrl,
                duration: displayMeals[index].duration,
                complexity: displayMeals[index].complexity,
                affordability: displayMeals[index].affordability,
            );

          },
          itemCount: displayMeals.length,
        ),
      )
    );
  }
}