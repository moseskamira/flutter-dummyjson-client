import 'package:dummy_json_api/core/utils/common_functions.dart';
import 'package:dummy_json_api/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../app/themes/app_colors.dart';
import '../../data/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final baseStyle = CommonFunctions.baseStyle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: double.infinity,
                  color: AppColors.greyColor.withValues(alpha: 0.3),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: GestureDetector(
                  onTap: () => setState(() => _isFavorited = !_isFavorited),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: const Color(0xFFE8935F),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Text(widget.product.title ?? '', style: baseStyle),
        const SizedBox(height: 4),
        Text(
          '${widget.product.price}',
          style: baseStyle.copyWith(
            color: AppColors.orangeTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
