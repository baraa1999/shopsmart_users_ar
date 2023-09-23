import 'package:flutter/material.dart';

class WishListModel with ChangeNotifier {
  final String Id;
  final String productId;
  WishListModel({
    required this.Id,
    required this.productId,
  });
}
