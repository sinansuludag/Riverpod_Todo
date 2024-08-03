import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Todo app',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(
              fontSize: 70.h,
            )
            ?.fontSize,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
