import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model.dart';

class ItemCategory extends StatelessWidget {
  final Category model;
  const ItemCategory({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 73.w,
        height: 70.h,
        child: Column(
          children: [
            Image(
                image: NetworkImage(model.media), width: 37.w, height: 37.h),
            Text(model.name)
          ],
        ),
      ),
    );
  }
}
