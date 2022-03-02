import 'package:flutter/material.dart';
import './main_drawer.dart';
class FilterScreen extends StatefulWidget{
  static const rounteName = '/filters';
  @override
  State<StatefulWidget> createState() {
    return FilterScreenState();
  }
}
class FilterScreenState extends State<FilterScreen>{
  bool _gluetenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged:(bool)=>updateValue(bool),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal Selection',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _gluetenFree,
                  (newValue){
                    setState(() {
                      _gluetenFree = newValue;
                    });
                  }
              ),
              _buildSwitchListTile(
                  'Lactose-free',
                  'Only include Lactose-free meals.',
                  _lactoseFree,
                      (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }
              ),
              _buildSwitchListTile(
                  'Vegeterian',
                  'Only include vegeterian meals.',
                  _vegeterian,
                      (newValue){
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }
              ),
              _buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals.',
                  _vegan,
                      (newValue){
                    setState(() {
                      _vegan = newValue;
                    });
                  }
              )
            ],
          ))
        ],
      ),

    );
  }
}