import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopsmart_users_ar/screens/cart/cart_widget.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/widgets/empty_bag.dart';
import 'package:shopsmart_users_ar/widgets/subtitle_text.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.shoppingBasket,
                title: "You cart is empty",
                subtitle:
                    'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
                buttonText: 'Shop Now'))
        : Scaffold(
            appBar: AppBar(
              title: const TitlesTextWidget(label: 'Cart (5)'),
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
            body: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const CartWidget();
                }),
          );
  }
}
