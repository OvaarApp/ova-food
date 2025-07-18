import 'package:flutter/material.dart';
import 'package:food_app/theme/app_theme.dart';
import 'package:food_app/screens/layout.dart';
import 'package:food_app/utils/screen_size.dart';

void main() {
  runApp(const MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Food App',
        debugShowCheckedModeBanner: false,
         theme: AppTheme.dark,
        home: const Layout(), // Replace with your first screen
      ),
    );
  }
}
