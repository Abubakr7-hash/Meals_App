import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/controller/providers/filters_provider.dart';
import 'package:meals_app/views/widgets/filtre_listile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          FiltreListile(
            value: valueFilter[Filter.glutenFree]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            titleString: 'Gluten-free',
            subTitleString: 'Only include glten-free meals.',
          ),
          FiltreListile(
            value: valueFilter[Filter.lactoseFree]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            titleString: 'Lactose-free',
            subTitleString: 'Only include lactose-free meals.',
          ),

          FiltreListile(
            value: valueFilter[Filter.vegetarian]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            titleString: 'Vegetarin',
            subTitleString: 'Only include Vegetarin meals.',
          ),

          FiltreListile(
            value: valueFilter[Filter.vegan]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            titleString: 'Vagen',
            subTitleString: 'Only include Vagen meals.',
          ),
        ],
      ),
    );
  }
}
