part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class FetchProductDetails extends ProductDetailsEvent {
  final String id;
  FetchProductDetails(this.id);
}

class ChangeImages extends ProductDetailsEvent {
  final int index;
  ChangeImages(this.index);
}
