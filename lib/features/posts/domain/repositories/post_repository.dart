import 'package:dummy_json_api/core/network/response/network_response.dart';

abstract class PostRepository {
  Future<NetworkResponse> getPosts();

  Future<NetworkResponse> getPostById(String postId);

  Future<NetworkResponse> getUserPosts(String userId);
}
