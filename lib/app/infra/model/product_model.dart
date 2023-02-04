import 'package:fakestore/app/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product extends ProductEntity with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String price,
    required String category,
    required String description,
    required String image,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
