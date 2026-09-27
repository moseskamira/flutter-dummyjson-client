import 'package:dummy_json_api/core/utils/common_functions.dart';
import 'package:flutter/material.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../core/utils/constants.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = CommonFunctions.baseStyle;
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.orangeTextColor,
        borderRadius: BorderRadius.circular(defaultBorderRadius * 3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enjoy the 20% discount for the November month',
              style: baseStyle.copyWith(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: defaultPadding),
            Text(
              'SHOP NOW',
              style: baseStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
