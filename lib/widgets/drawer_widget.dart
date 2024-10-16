import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({required this.onSetMenu, super.key});

  final void Function(String identifier) onSetMenu;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
            ),
            onTap: () {
              onSetMenu('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
            ),
            onTap: () {
              onSetMenu('filters');
            },
          ),
        ],
      ),
    );
  }
}