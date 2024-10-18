part of 'user_products_bloc.dart';

sealed class UserProductsEvent {
  const UserProductsEvent();
}

class LoadUserProducts extends UserProductsEvent {}

class GetFilteredProducts extends UserProductsEvent {
  const GetFilteredProducts({
    required this.filteredVideoList,
    required this.isHidden,
  });

  final IList<UserVideo> filteredVideoList;
  final bool isHidden;
}
