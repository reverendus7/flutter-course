import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The state is created and provided to the whole app using a ChangeNotifierProvider.
    // This allows any widget in the app to get hold of the state.
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// defines the data the app needs to function
// The state class extends ChangeNotifier, which means that it can notify others
// about its own changes. For example, if the current word pair changes, some widgets in the app need to know.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  // Every widget defines a build() method that's automatically called every time
  // the widget's circumstances change so that the widget is always up to date.
  @override
  Widget build(BuildContext context) {
    // tracks changes to the app's current state using the watch method.
    var appState = context.watch<MyAppState>();

    // Every build method must return a widget or (more typically) a nested tree
    // of widgets. In this case, the top-level widget is Scaffold.
    return Scaffold(
      // Column is one of the most basic layout widgets in Flutter. It takes any
      // number of children and puts them in a column from top to bottom. By default,
      // the column visually places its children at the top
      body: Column(
        children: [
          Text('A random idea: coins'),
          // This second Text widget takes appState, and accesses the only member of that class, current
          Text(appState.current.asLowerCase),

          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('Next'),
          )
        ],
      ),
    );
  }
}