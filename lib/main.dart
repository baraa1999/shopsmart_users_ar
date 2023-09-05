import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/consts/theme_data.dart';
import 'package:shopsmart_users_ar/providers/theme_provider.dart';
import 'package:shopsmart_users_ar/root_screen.dart';
import 'package:shopsmart_users_ar/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Shop Smart AR',
          theme: Styless.themeData(
              isDarkthme: themeProvider.getIsDarkTheme, context: context),
          home: const RootScreen(),
        );
      }),
    );
  }
}
