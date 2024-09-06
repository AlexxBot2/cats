import 'package:cats/core/theme/colors.dart';
import 'package:cats/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CatDetailItemWidget extends StatelessWidget {
  const CatDetailItemWidget(this.itemKey,
    this.itemValue, {
    super.key,
    
  });

  final String itemKey;
  final String itemValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$itemKey :  ', style: AppTheme.normalTextStyle.copyWith(color: AppColor.primaryColor, fontWeight: FontWeight.bold),),
          Expanded(child: Text(itemValue)),
        ],
      ),
    );
  }
}