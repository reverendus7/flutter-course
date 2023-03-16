import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BigCard.dart';
import 'MyApp.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // tracks changes to the app's current state using the watch method.
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      // Column is one of the most basic layout widgets in Flutter. It takes any
      // number of children and puts them in a column from top to bottom. By default,
      // the column visually places its children at the top
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // This Text widget takes appState, and accesses a member of that class, pair
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}