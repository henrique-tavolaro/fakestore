import 'package:fakestore/app/core/design_system/app_colors.dart';
import 'package:fakestore/app/core/design_system/app_textstyle.dart';
import 'package:flutter/material.dart';

import 'category_tile.dart';

class CategoriesRow extends StatelessWidget {
  final List<String> categoryList;

  const CategoriesRow({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: [
            for(String category in categoryList)
              CategoryTile(category: category,)
          ],
        ),
      ),
    );
  }
}

