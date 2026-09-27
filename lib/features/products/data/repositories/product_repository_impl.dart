import 'package:dio/dio.dart';
import 'package:dummy_json_api/core/network/response/network_response.dart';
import 'package:dummy_json_api/core/network/retrofit/api_client.dart';
import 'package:dummy_json_api/core/network/retrofit/api_service.dart';
import 'package:dummy_json_api/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late ApiClient apiClient;

  ProductRepositoryImpl() {
    apiClient = ApiService().apiClient;
  }

  @override
  Future<NetworkResponse> getProducts() async {
    try {
      final response = await apiClient.getProducts();
      return NetworkResponse(true, data: response);
    } on DioException catch (e) {
      final message = e.response?.data['message'];
      return NetworkResponse(false, error: message);
    } catch (e) {
      final error = e.toString();
      return NetworkResponse(false, error: error);
    }
  }

  @override
  Future<NetworkResponse> getProduct(String prodId) async {
    try {
      final response = await apiClient.getProduct(prodId);
      return NetworkResponse(true, data: response);
    } on DioException catch (e) {
      final message = e.response?.data['message'];
      return NetworkResponse(false, error: message);
    } catch (e) {
      final error = e.toString();
      return NetworkResponse(false, error: error);
    }
  }

  @override
  Future<NetworkResponse> getProductsCategories() async {
    try {
      final response = await apiClient.getProductsCategories();
      return NetworkResponse(true, data: response);
    } on DioException catch (e) {
      final message = e.response?.data['message'];
      return NetworkResponse(false, error: message);
    } catch (e) {
      final error = e.toString();
      return NetworkResponse(false, error: error);
    }
  }
}
