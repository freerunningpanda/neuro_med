import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

typedef _Emit = Emitter<ProductsState>;

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.getProducts) : super(ProductsLoading()) {
    on<LoadProducts>(_loadProducts);

    add(
      LoadProducts(),
    );
  }

  final GetProducts getProducts;

  Future<void> _loadProducts(LoadProducts event, _Emit emit) async {
    await getProducts.call(NoParams()).fold(
          (failure) => emit(ProductsError(failure.error ?? '')),
          (products) => emit(
            ProductsLoaded(
              products,
            ),
          ),
        );
  }
}
