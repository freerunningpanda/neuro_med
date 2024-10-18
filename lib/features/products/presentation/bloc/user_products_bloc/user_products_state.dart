part of 'user_products_bloc.dart';

sealed class UserProductsState extends Equatable {
  const UserProductsState();

  @override
  List<Object?> get props => [];
}

class UserProductsLoading extends UserProductsState {}

class UserProductsLoaded extends UserProductsState {
  const UserProductsLoaded({
    required this.userProductList,
    this.filteredVideoList,
    this.isPassedToggleOn = false,
  });

  final IList<UserProduct> userProductList;
  final IList<UserVideo>? filteredVideoList;
  final bool isPassedToggleOn;

  @override
  List<Object?> get props => [
        userProductList,
        filteredVideoList,
        isPassedToggleOn,
      ];
}

class UserProductsError extends UserProductsState {
  const UserProductsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
