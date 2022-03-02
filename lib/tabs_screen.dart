import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
class TabsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}
class TabsScreenState extends State<TabsScreen>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            onTap: (pos){},
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          )
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen()
          ],
        ),
      ),
    );
  }
}