import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:fakestore/app/presentation/pages/home/components/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;

  const ProductsGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return ProductTile(product: item, onClick: () {});
          }),
    );
  }
}
