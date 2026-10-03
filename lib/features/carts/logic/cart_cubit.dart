import 'package:dummy_json_api/features/carts/data/models/cart.dart';
import 'package:dummy_json_api/features/carts/domain/repositories/cart_repository.dart';
import 'package:dummy_json_api/features/carts/logic/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/carts_response.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit({required this.repository}) : super(Initial());

  Future<void> getCarts() async {
    emit(CartsLoading());
    final response = await repository.getCarts();
    if (response.success) {
      final responseData = response.data as CartsResponse;
      emit(CartsSuccess(responseData));
    } else {
      final error = response.error ?? 'Something wrong happened';
      emit(CartsError(error));
    }
  }

  Future<void> getCart(String cartId) async {
    emit(CartLoading());
    final response = await repository.getCart(cartId);
    if (response.success) {
      final cart = response.data as Cart;
      emit(CartSuccess(cart));
    } else {
      final error = response.error ?? 'Something wrong happened';
      emit(CartError(error));
    }
  }
}
