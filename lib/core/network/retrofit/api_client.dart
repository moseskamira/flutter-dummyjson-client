import 'package:dio/dio.dart';
import 'package:dummy_json_api/features/auth/data/models/login_response.dart';
import 'package:dummy_json_api/features/carts/data/models/cart.dart';
import 'package:dummy_json_api/features/carts/data/models/carts_response.dart';
import 'package:dummy_json_api/features/posts/data/models/post.dart';
import 'package:dummy_json_api/features/posts/data/models/posts_response.dart';
import 'package:dummy_json_api/features/products/data/models/category.dart';
import 'package:dummy_json_api/features/products/data/models/product.dart';
import 'package:dummy_json_api/features/products/data/models/product_response.dart';
import 'package:dummy_json_api/features/profile/data/models/user_profile_dto.dart';
import 'package:dummy_json_api/features/users/data/models/users_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/login_request.dart';
import 'apis.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) => _ApiClient(dio);

  @POST(Apis.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @GET(Apis.profile)
  Future<UserProfileDto> profile();

  @GET(Apis.users)
  Future<UsersResponse> getUsers();

  @GET(Apis.user)
  Future<dynamic> getUserInfo(@Path("id") String userId);

  @GET(Apis.products)
  Future<ProductsResponse> getProducts();

  @GET(Apis.product)
  Future<Product> getProduct(@Path('id') String prodId);

  @GET(Apis.productCategories)
  Future<List<Category>> getProductsCategories();

  @GET(Apis.carts)
  Future<CartsResponse> getCarts();

  @GET(Apis.cart)
  Future<Cart> getCart(@Path('id') String cartId);

  @GET(Apis.posts)
  Future<PostsResponse> getPosts();

  @GET(Apis.post)
  Future<dynamic> getPostById(@Path('id') String postId);

  @GET(Apis.userPosts)
  Future<PostsResponse> getUserPosts(@Path('id') String userId);
}
