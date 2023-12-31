import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopsmart_users_ar/widgets/titile_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget(
      {super.key, this.fontsize = 30, required int fontSize});
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(seconds: 16),
        baseColor: Colors.purple,
        highlightColor: Colors.red,
        child: TitlesTextWidget(
          label: 'Shop Smart',
          fontSize: fontsize,
        ));
  }
}
