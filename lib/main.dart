import 'package:firebase_core/firebase_core.dart';
// Import the generated file
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/providers/cart_provider.dart';
import 'package:shopsmart_users_ar/providers/product_provider.dart';
import 'package:shopsmart_users_ar/providers/theme_provider.dart';
import 'package:shopsmart_users_ar/providers/viewed_product_provider.dart';
import 'package:shopsmart_users_ar/providers/wishlist_provider.dart';
import 'package:shopsmart_users_ar/screens/auth/forget_password.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/viewed_recently.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/wishlist.dart';
import 'package:shopsmart_users_ar/screens/search_screen.dart';

import 'consts/theme_data.dart';
import 'root_screen.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/inner_screens/orders/orders_screen.dart';
import 'screens/inner_screens/product_details.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // initalize firebase connect multiple devices
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            Scaffold(
              body: Center(
                child: SelectableText(
                    "An error has been occured ${snapshot.error}"),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => ProductProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => WishListProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => ViewedProdProvider(),
              ),
            ],
            child: Consumer<ThemeProvider>(
              builder: (
                context,
                themeProvider,
                child,
              ) {
                return MaterialApp(
                  title: 'Shop Smart AR',
                  theme: Styles.themeData(
                      isDarkTheme: themeProvider.getIsDarkTheme,
                      context: context),
                  home: const RootScreen(),
                  // home: const RegisterScreen(),
                  routes: {
                    ProductDetails.routeName: (context) =>
                        const ProductDetails(),
                    WishListScreen.routeName: (context) =>
                        const WishListScreen(),
                    ViewedRecentlyScreen.routeName: (context) =>
                        const ViewedRecentlyScreen(),
                    RegisterScreen.routName: (context) =>
                        const RegisterScreen(),
                    LoginScreen.routName: (context) => const LoginScreen(),
                    OrdersScreenFree.routeName: (context) =>
                        const OrdersScreenFree(),
                    ForgotPasswordScreen.routeName: (context) =>
                        const ForgotPasswordScreen(),
                    SearchScreen.routeName: (context) => const SearchScreen(),
                  },
                );
              },
            ),
          );
        });
  }
}
