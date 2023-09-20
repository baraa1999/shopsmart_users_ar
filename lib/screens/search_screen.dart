import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/models/product_model.dart';
import 'package:shopsmart_users_ar/providers/product_provider.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/widgets/products/product_widget.dart';
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
    //  call provider product
    final productProvider = Provider.of<ProductProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const TitlesTextWidget(label: "Search"),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetsManager.shoppingCart),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          // setState(() {

                          // });
                          searchTextController.clear();
                          FocusScope.of(context).unfocus();
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
                const SizedBox(height: 15),
                Expanded(
                  child: DynamicHeightGridView(
                      itemCount: productProvider.getProduct.length,
                      builder: (context, index) {
                        //
                        return ChangeNotifierProvider.value(
                          value: productProvider.getProduct[index],
                          child: ProductWidget(
                            productId:
                                productProvider.getProduct[index].productId,
                          ),
                        );
                      },
                      crossAxisCount: 2),
                )
              ],
            ),
          )),
    );
  }
}
