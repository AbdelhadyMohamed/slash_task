part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class FetchProductDetails extends ProductDetailsEvent {
  final String id;
  FetchProductDetails(this.id);
}

class CheckColors extends ProductDetailsEvent {}
