import 'package:dio/dio.dart';
import 'package:dummy_json_api/core/network/response/network_response.dart';
import 'package:dummy_json_api/core/network/retrofit/api_client.dart';
import 'package:dummy_json_api/core/network/retrofit/api_service.dart';
import 'package:dummy_json_api/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  late ApiClient apiClient;

  PostRepositoryImpl() {
    apiClient = ApiService().apiClient;
  }

  @override
  Future<NetworkResponse> getPosts() async {
    try {
      final response = await apiClient.getPosts();
      return NetworkResponse(true, data: response);
    } on DioException catch (e) {
      final message = e.response?.data?['message'];
      return NetworkResponse(false, error: message);
    } catch (e) {
      final error = e.toString();
      return NetworkResponse(false, error: error);
    }
  }

  @override
  Future<NetworkResponse> getUserPosts(String userId) async {
    try {
      final response = await apiClient.getUserPosts(userId);
      return NetworkResponse(true, data: response);
    } on DioException catch (e) {
      final message = e.response?.data?['message'];
      return NetworkResponse(false, error: message);
    } catch (e) {
      final error = e.toString();
      return NetworkResponse(false, error: error);
    }
  }

  @override
  Future<NetworkResponse> getPostById(String postId) async {
    try {
      final response = await apiClient.getPostById(postId);
      return NetworkResponse(true, data: response);
    } on DioException catch (e) {
      final message = e.response?.data?['message'];
      return NetworkResponse(false, error: message);
    } catch (e) {
      final error = e.toString();
      return NetworkResponse(false, error: error);
    }
  }
}
