import 'package:cats/core/config/routes.dart';
import 'package:cats/core/theme/colors.dart';
import 'package:cats/core/theme/theme.dart';
import 'package:cats/core/widgets/image_widget.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:flutter/material.dart';

class CatItemWidget extends StatelessWidget {
  const CatItemWidget({
    super.key,
    required this.cat,
  });

  final Cat cat;

  Future<void> _showDetail(BuildContext context) async {
    Navigator.pushNamed(context, RouteGenerator.catDetailPage, arguments: cat);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.inputBorderColor)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cat.name,
                    style: AppTheme.titleTextStyle.copyWith(fontSize: 18, color: AppColor.primaryColor),
                  ),
                  TextButton(
                      onPressed: () {
                        _showDetail(context);
                      },
                      child: Text(
                        'More...',
                        style: AppTheme.normalTextStyle
                            .copyWith(color: AppColor.primaryColor),
                      ))
                ],
              ),
            ),
            ImageWidget(imagePath: cat.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cat.origin),
                  Text('Intelligence :  ${cat.intelligence}'), 
                 
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

