import 'package:flutter/material.dart';

import 'package:pet/src/widgets/expenses.dart';

var petColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue.shade100);
var petDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 10, 1, 50),
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: petDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: petDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: petDarkColorScheme.primaryContainer,
            foregroundColor: petDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: petColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: petColorScheme.onPrimaryContainer,
          foregroundColor: petColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: petColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: petColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: petColorScheme.secondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      //themeMode: ThemeMode.system,//deafult
      home: const Expences(),
    ),
  );
}
