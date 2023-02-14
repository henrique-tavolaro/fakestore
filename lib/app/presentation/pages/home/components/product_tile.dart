import 'package:fakestore/app/core/constants/app_texts.dart';
import 'package:fakestore/app/core/design_system/app_textstyle.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onClick;

  const ProductTile({
    Key? key,
    required this.product,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
            )),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(product.price.toString()).h5(align: TextAlign.start),
            Text(product.title).h6(),
            Row(
              children: [
                Text(AppTexts.add),
                const SizedBox(
                  width: 24,
                ),
                IconButton(
                  onPressed: onClick,
                  icon: Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
