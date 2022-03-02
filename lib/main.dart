import 'dart:ui';

import 'package:flutter/material.dart';
import './categories_meals_screen.dart';
import './categories_screen.dart';
import './meal_details.dart';
import './tabs_screen.dart';
import './filters_screen.dart';
void main() {
  runApp(MaterialApp(
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
    //home: CategoriesScreen(),
    //initialRoute: '/',
    routes: {
      '/': (ctx) => TabsScreen(),
      MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(),
      FilterScreen.rounteName:(ctx) => FilterScreen()
    },
    onGenerateRoute: (settings){
      return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
    },
    onUnknownRoute: (settings){
      return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
    },

  ));
}
