import 'package:dummy_json_api/features/posts/data/models/post.dart';
import 'package:dummy_json_api/features/posts/data/models/posts_response.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends PostState {}

class PostsLoading extends PostState {}

class GetPostByIDLoading extends PostState {}

class UserPostsLoading extends PostState {}

class PostsSuccess extends PostState {
  final PostsResponse? response;

  PostsSuccess({this.response});

  @override
  List<Object?> get props => [response];
}

class UserPostsSuccess extends PostState {
  final PostsResponse? response;

  UserPostsSuccess({this.response});

  @override
  List<Object?> get props => [response];
}

class GetPostByIDSuccess extends PostState {
  final Post? post;

  GetPostByIDSuccess({this.post});

  @override
  List<Object?> get props => [post];
}

class PostsError extends PostState {
  final String message;

  PostsError({required this.message});

  @override
  List<Object?> get props => [message];
}

class UserPostsError extends PostState {
  final String message;

  UserPostsError({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetPostByIDError extends PostState {
  final String message;

  GetPostByIDError({required this.message});

  @override
  List<Object?> get props => [message];
}
