import 'package:dummy_json_api/core/utils/common_functions.dart';
import 'package:dummy_json_api/features/products/data/models/category.dart';
import 'package:flutter/material.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../core/utils/constants.dart';

class ProductCategoryCard extends StatelessWidget {
  final Category category;
  final bool isSelected;

  const ProductCategoryCard({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = CommonFunctions.baseStyle;
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.greyColor.withValues(alpha: 0.6)
              : AppColors.greyColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(defaultBorderRadius * 2),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Center(
            child: Text(
              '${category.name}',
              style: baseStyle.copyWith(fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
