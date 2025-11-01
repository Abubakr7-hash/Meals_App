import 'package:flutter/material.dart';

class FiltreListile extends StatelessWidget {
  const FiltreListile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.titleString,
    required this.subTitleString,
  });
  final bool value;
  final void Function(bool checkValue) onChanged;
  final String titleString;
  final String subTitleString;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        titleString,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subTitleString,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 30, right: 20),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
