import 'package:dummy_json_api/features/products/data/models/product.dart';
import 'package:dummy_json_api/features/products/domain/repositories/product_repository.dart';
import 'package:dummy_json_api/features/products/logic/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/category.dart';
import '../data/models/product_response.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(Initial());

  List<Category> _categories = [];
  List<Product> _products = [];

  List<Product> get products => _products;

  List<Category> get categories => _categories;

  void clearData() {
    _categories = [];
    _products = [];
    emit(GPSuccess(products: []));
    emit(GetProductsCategoriesSuccess(categories: []));
  }

  Future<void> getProducts() async {
    emit(GPLoading());
    final response = await repository.getProducts();
    if (response.success) {
      final responseData = response.data as ProductsResponse;
      _products = responseData.products ?? [];
      emit(GPSuccess(products: _products));
    } else {
      final message = response.error ?? 'Something went wrong';
      emit(GPError(message: message));
    }
  }

  Future<void> getProduct(String prodId) async {
    emit(GetSingleProductLoading());
    final response = await repository.getProduct(prodId);
    if (response.success) {
      final product = response.data as Product;
      emit(GetSingleProductSuccess(product: product));
    } else {
      final message = response.error ?? 'Something went wrong';
      emit(GetSingleProductError(message: message));
    }
  }

  Future<void> getProductsCategories() async {
    emit(GetProductsCategoriesLoading());
    final response = await repository.getProductsCategories();
    if (response.success) {
      _categories = response.data;
      emit(GetProductsCategoriesSuccess(categories: _categories));
    } else {
      final message = response.error ?? 'Something went wrong';
      emit(GetProductsCategoriesError(message: message));
    }
  }
}
