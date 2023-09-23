import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/providers/wishlist_provider.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/services/my_app_methode.dart';
import 'package:shopsmart_users_ar/widgets/empty_bag.dart';
import 'package:shopsmart_users_ar/widgets/products/product_widget.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static const routeName = '/WishListScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final wishListProvider = Provider.of<WishListProvider>(context);

    return wishListProvider.getWishListItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.bagWish,
                title: "You WishList is empty",
                subtitle:
                    'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
                buttonText: 'Shop Now'))
        : Scaffold(
            appBar: AppBar(
              title: TitlesTextWidget(
                  label:
                      'WishList (${wishListProvider.getWishListItems.length})'),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      MyAppMethods.showErrorORWarningDialog(
                          isError: false,
                          context: context,
                          subtitle: 'Remove Items',
                          fct: () {
                            wishListProvider.clearLocalWishList();
                          });
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ))
              ],
            ),
            body: DynamicHeightGridView(
                itemCount: wishListProvider.getWishListItems.length,
                builder: (context, index) {
                  return ProductWidget(
                    productId: wishListProvider.getWishListItems.values
                        .toList()[index]
                        .productId,
                  );
                },
                crossAxisCount: 2));
  }
}
