import 'dart:ui';

import 'package:flutter/material.dart';
import './categories_meals_screen.dart';
import './categories_screen.dart';
import './meal_details.dart';
import './tabs_screen.dart';
import './filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';
void main() {
  runApp(Home());
}
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          canvasColor: Color.fromRGBO(225, 254,229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold
              )
          )
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(_availableMeals),
        FilterScreen.rounteName:(ctx) => FilterScreen(_setFilters,_filters)
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen(_availableMeals));
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

    );
  }
}
