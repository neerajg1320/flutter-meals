import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onValueChange,
  });

  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool value) onValueChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
            value: value, 
            onChanged: onValueChange, 
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            subtitle: Text(
                subtitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),              
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22,),
          );
  }
}