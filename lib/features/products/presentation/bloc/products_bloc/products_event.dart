part of 'products_bloc.dart';

sealed class ProductsEvent {
  const ProductsEvent();
}

class LoadProducts extends ProductsEvent {}
