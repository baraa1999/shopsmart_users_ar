import 'package:firebase_core/firebase_core.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // listen the change is challenged in the product
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
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
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          title: 'Shop Smart AR',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const RootScreen(),
          // home: const RegisterScreen(),
          routes: {
            ProductDetails.routeName: (context) => const ProductDetails(),
            WishListScreen.routeName: (context) => const WishListScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
            LoginScreen.routName: (context) => const LoginScreen(),
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
            SearchScreen.routeName: (context) => const SearchScreen(),
          },
        );
      }),
    );
  }
}
