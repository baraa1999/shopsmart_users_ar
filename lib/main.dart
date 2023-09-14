import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/providers/theme_provider.dart';
import 'package:shopsmart_users_ar/screens/auth/login.dart';
import 'package:shopsmart_users_ar/screens/auth/register.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/product_details.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/viewed_recently.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/wishlist.dart';

import 'consts/theme_data.dart';
import 'root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          title: 'Shop Smart AR',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          // home: const RootScreen(),
          home: const LoginScreen(),
          routes: {
            ProductDetails.routeName: (context) => const ProductDetails(),
            WishListScreen.routeName: (context) => const WishListScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
          },
        );
      }),
    );
  }
}
