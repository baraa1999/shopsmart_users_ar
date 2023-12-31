import 'package:flutter/widgets.dart';
import 'package:shopsmart_users_ar/models/cart_model.dart';
import 'package:shopsmart_users_ar/models/product_model.dart';
import 'package:shopsmart_users_ar/providers/product_provider.dart';
import 'package:uuid/uuid.dart';

// // used the classs listen to change challenged
class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};
  // return cart items
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  // see if the product fouund inside items
  bool isProductInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  // function add product via user
  void addProductToCart({required String productId}) {
    // key : value
    // allows you to add a new entry to a map if the key does not already exist
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
            cartId: const Uuid().v4(), productId: productId, quantity: 1));
    notifyListeners();
  }

// function update quantity
  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
        productId,
        (item) => CartModel(
            cartId: item.cartId, productId: productId, quantity: quantity));
    notifyListeners();
  }

  // function return total
  double getTotal({required ProductProvider productProvider}) {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      final ProductModel? getCurrProduct =
          productProvider.findByproId(value.productId);
      if (getCurrProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  // function quantity On my side total
  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  // function remove
  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  // clear
  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
