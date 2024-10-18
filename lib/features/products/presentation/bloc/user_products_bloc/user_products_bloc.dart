import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/domain/usecases/get_user_products.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

part 'user_products_event.dart';
part 'user_products_state.dart';

typedef _Emit = Emitter<UserProductsState>;

class UserProductsBloc extends Bloc<UserProductsEvent, UserProductsState> {
  UserProductsBloc(this.getProducts) : super(UserProductsLoading()) {
    on<LoadUserProducts>(_loadUserProducts);
    on<GetFilteredProducts>(_getFilteredProducts);

    add(
      LoadUserProducts(),
    );
  }

  final GetUserProducts getProducts;

  Future<void> _loadUserProducts(LoadUserProducts event, _Emit emit) async {
    await getProducts.call(NoParams()).fold(
          (failure) => emit(UserProductsError(failure.error ?? '')),
          (products) => emit(
            UserProductsLoaded(
              userProductList: products,
            ),
          ),
        );
  }

  Future<void> _getFilteredProducts(
    GetFilteredProducts event,
    _Emit emit,
  ) async {
    final currentState = state;
    if (currentState is UserProductsLoaded) {
      switch (event.isHidden) {
        case true:
          emit(
            UserProductsLoaded(
              userProductList: currentState.userProductList,
              filteredVideoList: event.filteredVideoList
                  .where((video) => video.status != Status.done)
                  .toIList(),
              isPassedToggleOn: event.isHidden,
            ),
          );
        case false:
          emit(
            UserProductsLoaded(
              userProductList: currentState.userProductList,
              isPassedToggleOn: event.isHidden,
            ),
          );
      }
    }
  }
}
