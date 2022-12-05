import 'package:flutter/material.dart';
import 'package:note/di/provider_setup.dart';
import 'package:note/ui/colors.dart';
import 'package:provider/provider.dart';

import 'presentation/notes/notes_screen.dart';

void main() async {
  final providers = await getProviders();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: darkGrey,
        canvasColor: darkGrey,
        floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.white,
          foregroundColor: darkGrey,
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: darkGrey,

        ),
      ),
      home: const NotesScreen(),
    );
  }
}
