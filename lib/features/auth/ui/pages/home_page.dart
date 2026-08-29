import 'package:dummy_json_api/app/themes/app_colors.dart';
import 'package:dummy_json_api/core/utils/common_functions.dart';
import 'package:dummy_json_api/core/utils/constants.dart';
import 'package:dummy_json_api/features/products/logic/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/logic/product_cubit.dart';
import '../../../products/ui/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<ProductCubit>().getProducts(),
        context.read<ProductCubit>().getProductsCategories(),

        // context.read<ProfileCubit>().getProfile(),
        // context.read<UserCubit>().getUsers(),
        // context.read<ProductCubit>().getProduct('1'),
        // context.read<CartCubit>().getCarts(),
        // context.read<CartCubit>().getCart('1'),
        // context.read<PostCubit>().getPosts(),
        // context.read<PostCubit>().getPostByID('1'),
        // context.read<PostCubit>().getUserPosts('1'),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = CommonFunctions.baseStyle;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, Moses'),
            SizedBox(height: defaultPadding * 2),
            Container(
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
            ),
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: baseStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: baseStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            BlocBuilder<ProductCubit, ProductState>(
              buildWhen: (prev, current) {
                return current is GetProductsCategoriesLoading ||
                    current is GetProductsCategoriesError ||
                    current is GetProductsCategoriesSuccess;
              },
              builder: (ctx, state) {
                if (state is GetProductsCategoriesLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                final cubit = context.read<ProductCubit>();
                final categories = cubit.categories;
                return SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(
                              defaultBorderRadius * 2,
                            ),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.category),
                                Flexible(
                                  child: Text(
                                    '${category.name}',
                                    style: baseStyle.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: baseStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: baseStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            BlocBuilder<ProductCubit, ProductState>(
              buildWhen: (prev, current) {
                return current is GPError ||
                    current is GPLoading ||
                    current is GPSuccess;
              },
              builder: (ctx, state) {
                if (state is GPLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                final cubit = ctx.read<ProductCubit>();
                final products = cubit.products;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      final product = products[index];
                      return SizedBox(
                        height: 200,
                        child: ProductCard(product: product),
                      );
                    },
                  ),
                );
                return Text('product');
              },
            ),
          ],
        ),
      ),
    );
  }
}
