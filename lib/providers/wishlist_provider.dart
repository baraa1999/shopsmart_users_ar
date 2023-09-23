import 'package:flutter/widgets.dart';
import 'package:shopsmart_users_ar/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

// // used the classs listen to change challenged
class WishListProvider with ChangeNotifier {
  Map<String, WishListModel> _wishListItems = {};
  // return cart items
  Map<String, WishListModel> get getWishListItems {
    return _wishListItems;
  }

  bool isProductInWishList({required String productId}) {
    return _wishListItems.containsKey(productId);
  }

  void addOrRemoveFromWishList({required String productId}) {
    if (_wishListItems.containsKey(productId)) {
      _wishListItems.remove(productId);
    } else {
      _wishListItems.putIfAbsent(
        productId,
        () => WishListModel(
          Id: Uuid().v4(),
          productId: productId,
        ),
      );
    }
    notifyListeners();
  }

  // clear
  void clearLocalWishList() {
    _wishListItems.clear();
    notifyListeners();
  }
}
