import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isNotEmpty) {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('You have ${favorites.length} favorites'),
          ),
          ...favorites
              .map((pair) => ListTile(
                    title: Text(pair.asLowerCase),
                    onTap: () {
                      appState.current = pair;
                      appState.toggleFavorite();
                    },
                  ))
              .toList(),
        ],
      );
    } else {
      return Center(
        child: Text('No favorites yet'),
      );
    }
  }
}
