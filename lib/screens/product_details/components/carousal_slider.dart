import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model.dart';

class ItemCarousal extends StatelessWidget {
  final Carousal image;
  const ItemCarousal({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

        items:  [
          Image(
            fit: BoxFit.cover,
            width: double.infinity,
            image: NetworkImage(
              image.url,
            ),
          ),
        ],
        options: CarouselOptions(
          height: 200.h,
          initialPage: 0,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
}
