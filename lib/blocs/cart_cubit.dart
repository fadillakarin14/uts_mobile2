import 'package:bloc/bloc.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void addProduct(Product product) {
    final index = state.indexWhere((p) => p.id == product.id);

    if (index == -1) {
      emit([...state, product.copyWith(quantity: 1)]);
    } else {
      final updated = state[index].copyWith(
        quantity: state[index].quantity + 1,
      );
      final newState = [...state];
      newState[index] = updated;
      emit(newState);
    }
  }

  void increaseQty(int id) {
    final index = state.indexWhere((p) => p.id == id);
    if (index == -1) return;

    final updated = state[index].copyWith(
      quantity: state[index].quantity + 1,
    );

    final newState = [...state];
    newState[index] = updated;
    emit(newState);
  }

  void decreaseQty(int id) {
    final index = state.indexWhere((p) => p.id == id);
    if (index == -1) return;

    if (state[index].quantity == 1) {
      emit(state.where((p) => p.id != id).toList());
    } else {
      final updated = state[index].copyWith(
        quantity: state[index].quantity - 1,
      );
      final newState = [...state];
      newState[index] = updated;
      emit(newState);
    }
  }

  int get totalItems =>
      state.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      state.fold(0, (sum, item) => sum + (item.quantity * item.price));
}

