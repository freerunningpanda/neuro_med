part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  const ProductsLoaded(this.productList);

  final IList<Category> productList;

  @override
  List<Object?> get props => [productList];
}

class ProductsError extends ProductsState {
  const ProductsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
