import 'package:dummy_json_api/core/utils/constants.dart';
import 'package:dummy_json_api/features/auth/ui/pages/cart_page.dart';
import 'package:dummy_json_api/features/auth/ui/pages/home_page.dart';
import 'package:dummy_json_api/features/auth/ui/pages/products_page.dart';
import 'package:dummy_json_api/features/auth/ui/pages/wishlist_page.dart';
import 'package:dummy_json_api/features/profile/ui/pages/profile_page.dart';
import 'package:dummy_json_api/shared/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/themes/app_colors.dart';

class AppShellPage extends StatefulWidget {
  const AppShellPage({super.key});

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  final List<Widget> _pages = [
    HomePage(),
    ProductsPage(),
    CartPage(),
    WishlistPage(),
    ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.inventory_2_outlined),
      activeIcon: Icon(Icons.inventory_2),
      label: 'Products',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      activeIcon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      activeIcon: Icon(Icons.favorite),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.read<AppStateProvider>().bottomNavIndex;
    return Scaffold(
      appBar: AppBar(),
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: defaultPadding),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: BottomNavigationBar(
          items: _bottomNavItems,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              context.read<AppStateProvider>().updateBottomNavIndex(index);
            });
          },
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 12,
          selectedItemColor: AppColors.appLightBlueColor,
          unselectedItemColor: AppColors.blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
