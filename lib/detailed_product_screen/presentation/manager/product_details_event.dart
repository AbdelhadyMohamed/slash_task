part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class FetchProductDetails extends ProductDetailsEvent {
  final String id;
  FetchProductDetails(this.id);
}

class ColorClickedEvent extends ProductDetailsEvent {
  final int id;
  final int ind;
  final String color;
  ColorClickedEvent(this.id, this.ind, this.color);
}

class SizeClickedEvent extends ProductDetailsEvent {
  final int id;
  final int ind;
  final String size;
  SizeClickedEvent(this.id, this.ind, this.size);
}

class MaterialClickedEvent extends ProductDetailsEvent {
  final int id;
  final int ind;
  final String material;
  MaterialClickedEvent(this.id, this.ind, this.material);
}
