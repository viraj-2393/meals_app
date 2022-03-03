import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import './main_drawer.dart';
import './models/meal.dart';
class TabsScreen extends StatefulWidget{
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}
class _TabsScreenState extends State<TabsScreen>{
  late List<Map<String,dynamic>> _pages;
  @override
  initState(){
    _pages = [
      {'page':CategoriesScreen(),'title':'Categories'},
      {'page':FavoriteScreen(widget.favoriteMeals),'title':'Favorites'}
    ];
    super.initState();
  }
  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),

        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items:[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon:Icon(Icons.category,),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon:Icon(Icons.star),
              label: 'Favorites'
          )
        ]
      ),
    );
  }
}