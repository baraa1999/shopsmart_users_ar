import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_ar/providers/viewed_product_provider.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/widgets/empty_bag.dart';
import 'package:shopsmart_users_ar/widgets/products/product_widget.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({super.key});
  static const routeName = '/ViewedRecentlyScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewdProvider = Provider.of<ViewedProdProvider>(context);

    return viewdProvider.getviewedProdItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.shoppingBasket,
                title: "You Viewed Recentlu is empty",
                subtitle:
                    'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
                buttonText: 'Shop Now'))
        : Scaffold(
            appBar: AppBar(
              title: TitlesTextWidget(
                  label:
                      'ViewdRecently (${viewdProvider.getviewedProdItems.length})'),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ))
              ],
            ),
            body: DynamicHeightGridView(
                itemCount: viewdProvider.getviewedProdItems.length,
                builder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductWidget(
                      productId: viewdProvider.getviewedProdItems.values
                          .toList()[index]
                          .productId,
                    ),
                  );
                },
                crossAxisCount: 2));
  }
}
