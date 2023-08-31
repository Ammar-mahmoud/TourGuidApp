import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/app_data.dart';
import 'package:tour_guide/widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 5/6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12
         ),
         children: Categories_data.map((e) => CategoryItem(title: e.title, imageUrl: e.imageUrl, id: e.id,)).toList()
    );
  }
}
