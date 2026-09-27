import 'package:dummy_json_api/core/network/response/network_response.dart';

abstract class ProductRepository {
  Future<NetworkResponse> getProducts();

  Future<NetworkResponse> getProduct(String prodId);

  Future<NetworkResponse> getProductsCategories();
}
