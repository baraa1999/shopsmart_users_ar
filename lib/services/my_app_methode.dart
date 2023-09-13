import 'package:flutter/material.dart';
import 'package:shopsmart_users_ar/services/assets_manger.dart';
import 'package:shopsmart_users_ar/widgets/subtitle_text.dart';

class MyAppMethode {
  static Future<void> showErrorOrwarningDialog(
      {required BuildContext context,
      required String subtitle,
      required Function fct,
      bool isError = true}) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AssetsManager.warning,
                height: 60,
                width: 60,
              ),
              const SizedBox(
                height: 16,
              ),
              SubtitleTextWidget(
                label: subtitle,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const SubtitleTextWidget(
                        label: 'Cancel',
                        color: Colors.green,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      fct();
                      Navigator.pop(context);
                    },
                    child: const SubtitleTextWidget(
                      label: 'Ok',
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
