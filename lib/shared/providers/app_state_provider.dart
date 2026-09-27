import 'package:dummy_json_api/features/profile/domain/models/user_profile.dart';
import 'package:flutter/cupertino.dart';

class AppStateProvider extends ChangeNotifier {
  UserProfile? _userProfile;
  int _bottomNavIndex = 0;
  String? _productCategory;

  int get bottomNavIndex => _bottomNavIndex;

  UserProfile? get userProfile => _userProfile;

  String? get productCategory => _productCategory;

  void updateBottomNavIndex(int value) {
    _bottomNavIndex = value;
    notifyListeners();
  }

  void updateUserProfile(UserProfile user) {
    _userProfile = user;
    notifyListeners();
  }

  void updateProductCategory(String category) {
    _productCategory = category;
    notifyListeners();
  }
}
