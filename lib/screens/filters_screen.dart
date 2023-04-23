import 'package:flutter/material.dart';
import 'package:meals/widgets/settings_item.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
          children: [
            SettingsItem(
              title: 'Glutten-free',
              subtitle: 'Only include glutten-free meals.',
              value: activeFilters[Filter.gluttenFree]!, 
              onValueChange: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.gluttenFree, isChecked);
            },),
            SettingsItem(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: activeFilters[Filter.lactoseFree]!, 
              onValueChange: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },),
            SettingsItem(
              title: 'Vegeterian',
              subtitle: 'Only include vegetrian meals.',
              value: activeFilters[Filter.vegeterian]!, 
              onValueChange: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegeterian, isChecked);
            },),  
            SettingsItem(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: activeFilters[Filter.vegan]!, 
              onValueChange: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
            },),                             
          ],
        ),
      
    );
  }
}