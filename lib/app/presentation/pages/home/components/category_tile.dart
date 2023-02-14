import 'package:fakestore/app/core/design_system/app_colors.dart';
import 'package:fakestore/app/core/design_system/app_textstyle.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final bool selected;

  const CategoryTile({
    Key? key,
    required this.category,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selected ? AppColor.grey400 : AppColor.purple500),
        child: Text(category).h5(style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}
