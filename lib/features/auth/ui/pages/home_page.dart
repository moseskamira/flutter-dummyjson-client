import 'package:dummy_json_api/core/utils/common_functions.dart';
import 'package:dummy_json_api/core/utils/constants.dart';
import 'package:dummy_json_api/features/products/logic/product_state.dart';
import 'package:dummy_json_api/features/profile/logic/profile_state.dart';
import 'package:dummy_json_api/shared/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/logic/product_cubit.dart';
import '../../../products/ui/widgets/product_card.dart';
import '../../../products/ui/widgets/product_category_card.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../widgets/home_page_header.dart';

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
      final productCubit = context.read<ProductCubit>();
      final profileCubit = context.read<ProfileCubit>();
      await Future.wait([
        productCubit.getProducts(),
        productCubit.getProductsCategories(),
        profileCubit.getProfile(),

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
    final providerRead = context.read<AppStateProvider>();
    final providerWatch = context.watch<AppStateProvider>();
    final userProfile = providerWatch.userProfile;
    final selectedProductCategory = providerWatch.productCategory;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (_, state) {
            if (state is SuccessState) {
              final profile = state.profile;
              providerRead.updateUserProfile(profile);
            }
          },
          builder: (_, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome, ${userProfile?.firstName}'),
                SizedBox(height: defaultPadding * 2),
                HomePageHeader(),
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
                    if (categories.isNotEmpty) {
                      final firstCategory = categories.first;
                      final firstCatName = firstCategory.name ?? '';
                      providerRead.updateProductCategory(firstCatName);
                    }
                    return SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final category = categories[index];
                          final catName = category.name ?? '';
                          final isSelected = selectedProductCategory == catName;
                          return InkWell(
                            onTap: () {
                              providerRead.updateProductCategory(catName);
                            },
                            child: ProductCategoryCard(
                              category: category,
                              isSelected: isSelected,
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
                    final products = cubit.products
                        .where(
                          (prod) =>
                              prod.category?.toLowerCase() ==
                              selectedProductCategory?.toLowerCase(),
                        )
                        .toList();
                    return Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (_, index) {
                          final product = products[index];
                          return SizedBox(
                            height: 200,
                            child: ProductCard(product: product),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio: 1,
                        ),
                      ),
                    );
                    return Text('product');
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
