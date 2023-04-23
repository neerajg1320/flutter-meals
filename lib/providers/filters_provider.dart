import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  gluttenFree,
  lactoseFree,
  vegeterian,
  vegan
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier(): super({
    Filter.gluttenFree: false,
    Filter.lactoseFree: false,
    Filter.vegeterian: false,
    Filter.vegan: false,
  });

  void setFilter(Filter filter, bool isActive) {
    state[filter] = isActive;
    state = {
      ...state,
      filter: isActive
    };
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier()
);