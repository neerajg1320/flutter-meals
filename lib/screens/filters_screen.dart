import 'package:flutter/material.dart';
import 'package:meals/widgets/settings_item.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);

    _gluttenFreeFilterSet = activeFilters[Filter.gluttenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegeterian = activeFilters[Filter.vegeterian]!;
    _vegan = activeFilters[Filter.vegan]!;
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.gluttenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegeterian: _vegeterian,
            Filter.vegan: _vegan,
          });
          // Navigator.of(context).pop(); 
          return true;
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