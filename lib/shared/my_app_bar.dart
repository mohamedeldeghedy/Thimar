import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/res/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? fontSize;
  final Widget? iconAction;
  final bool leadingIcon, actionIcon;
  final VoidCallback? backOnPressed, onPressedAction;

  const MyAppBar({
    super.key,
    required this.title,
    this.fontSize = 20,
    this.iconAction,
    this.backOnPressed,
    this.actionIcon = false,
    this.leadingIcon = true,
    this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: green),
      leading: leadingIcon
          ? Padding(
              padding: EdgeInsets.all(8.0.r),
              child: InkWell(
                onTap: backOnPressed,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: grey.withOpacity(0.5)),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 27,
                    color: green,
                  ),
                ),
              ),
            )
          : Container(),
      title: Text(
        title,
      ),
      actions: [
        if (actionIcon)
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: SizedBox(
              height: 40.h,
              width: 40.w,
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: Colors.grey[200],
                child: IconButton(
                    onPressed: onPressedAction,
                    icon: iconAction??const Text(''),
              ),)
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
