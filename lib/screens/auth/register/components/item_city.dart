import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/screens/auth/register/bloc/city_model.dart';

class ItemCity extends StatelessWidget {
  final CityData cityData;
  const ItemCity({Key? key, required this.cityData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      height: 40.h,width: 200.w,
      decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(20.r)),
        child: Text(cityData.name,style: TextStyle(fontSize: 20.sp,color: Colors.black,),));
  }
}
