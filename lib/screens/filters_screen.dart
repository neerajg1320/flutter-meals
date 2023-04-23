import 'package:flutter/material.dart';
import 'package:meals/widgets/settings_item.dart';
import 'package:meals/providers/filters_provider.dart';


class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _gluttenFreeFilterSet = widget.currentFilters[Filter.gluttenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegeterian = widget.currentFilters[Filter.vegeterian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegeterian: _vegeterian,
            Filter.vegan: _vegan,
          }); 
          return false;
        },
        child: Column(
          children: [
            SettingsItem(
              title: 'Glutten-free',
              subtitle: 'Only include glutten-free meals.',
              value: _gluttenFreeFilterSet, 
              onValueChange: (value) {
              setState(() {
                _gluttenFreeFilterSet = value;
              });
            },),
            SettingsItem(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: _lactoseFreeFilterSet, 
              onValueChange: (value) {
              setState(() {
                _lactoseFreeFilterSet = value;
              });
            },), 
            SettingsItem(
              title: 'Vegeterian',
              subtitle: 'Only include vegetrian meals.',
              value: _vegeterian, 
              onValueChange: (value) {
              setState(() {
                _vegeterian = value;
              });
            },),    
            SettingsItem(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: _vegan, 
              onValueChange: (value) {
              setState(() {
                _vegan = value;
              });
            },),                                 
          ],
        ),
      ),
    );
  }
}