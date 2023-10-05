import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/screens/auth/login.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/orders/orders_screen.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/viewed_recently.dart';
import 'package:shopsmart_users_ar/screens/inner_screens/wishlist.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/services/my_app_methode.dart';
import 'package:shopsmart_users_ar/widgets/subtitle_text.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

import '../providers/theme_provider.dart';
import '../widgets/app_name_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // auth
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const AppNameTextWidget(
            fontSize: 20,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TitlesTextWidget(
                      label: "Please login to have ultimate access"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.background,
                            width: 3),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Baraa Alian"),
                        SubtitleTextWidget(
                            label: "coding.with.Baraa@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitlesTextWidget(label: "General"),
                    CustomListTile(
                      imagePath: AssetsManager.orderSvg,
                      text: "All orders",
                      function: () async {
                        await Navigator.pushNamed(
                            context, OrdersScreenFree.routeName);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsManager.wishlistSvg,
                      text: "Wishlist",
                      function: () async {
                        await Navigator.pushNamed(
                            context, WishListScreen.routeName);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsManager.recent,
                      text: "Viewed recently",
                      function: () async {
                        await Navigator.pushNamed(
                            context, ViewedRecentlyScreen.routeName);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsManager.address,
                      text: "Address",
                      function: () {},
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const TitlesTextWidget(label: "Settings"),
                    const SizedBox(
                      height: 7,
                    ),
                    SwitchListTile(
                      secondary: Image.asset(
                        AssetsManager.theme,
                        height: 30,
                      ),
                      title: Text(themeProvider.getIsDarkTheme
                          ? "Dark mode"
                          : "Light mode"),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      },
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                  // auth
                  icon: Icon(user == null ? Icons.login : Icons.logout),
                  label: Text(
                    // auth
                    user == null ? "Login" : "Logout",
                  ),
                  onPressed: () async {
                    // auth
                    if (user == null) {
                      await Navigator.pushNamed(context, LoginScreen.routName);
                    } else {
                      await MyAppMethods.showErrorORWarningDialog(
                          context: context,
                          subtitle: 'Are you Sure',
                          fct: () async {},
                          isError: false);
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.function});
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      title: SubtitleTextWidget(label: text),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
