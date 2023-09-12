import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopsmart_users_ar/consts/app_constants.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/widgets/app_name_text.dart';
import 'package:shopsmart_users_ar/widgets/subtitle_text.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const routeName = '/ProductDetails';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppNameText(
          fontSize: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          // automaticallyImplyLeading: false,
        ),
      ),
      body: Column(
        children: [
          FancyShimmerImage(
            imageUrl: AppContants.productImageUrl,
            height: size.height * 0.38,
            width: double.infinity,
            boxFit: BoxFit.contain,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      // flex: 5,
                      child: Text(
                        "Titile" * 16,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    const SubtitleTextWidget(
                      label: "16.99\$",
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        color: Colors.teal.shade200,
                        shape: const CircleBorder(),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(IconlyLight.heart)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: kBottomNavigationBarHeight,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart),
                            label: const Text(
                              "Add to cart",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitlesTextWidget(label: "About this item"),
                    SubtitleTextWidget(label: 'In Phones'),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SubtitleTextWidget(label: 'description' * 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
