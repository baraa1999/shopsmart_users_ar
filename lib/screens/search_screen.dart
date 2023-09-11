import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/widgets/app_name_text.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const AppNameText(
              fontsize: 20,
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetsManager.shoppingCart),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchTextController.clear();
                            FocusScope.of(context).unfocus();
                          });
                        },
                        child: const Icon(
                          Icons.clear,
                          color: Colors.red,
                        )),
                  ),
                  onChanged: (value) {},
                  onSubmitted: (value) {
                    log(searchTextController.text);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
