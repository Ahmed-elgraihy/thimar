import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/colors.dart';

enum BottonType {
  Outlined,
  outlinedeisable,
  Elevated,
  Cancel,
  Reject,
}

class Botton extends StatelessWidget {
  Botton({
    super.key,
    this.text = "",
    required this.onPress,
    this.Type = BottonType.Elevated,  this.isbig=true,
  });

  final String text;
  final Function()? onPress;
  final bool isbig;
  final BottonType Type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff4C8613).withOpacity(.019),
            blurRadius: 15,
            offset: Offset(3, 6),
            blurStyle: BlurStyle.inner,
          )
        ],
      ),
      child: Type == BottonType.Outlined || Type == BottonType.outlinedeisable
          ? OutlinedButton(
              onPressed: onPress,
              child: Text(
                text,
                style: TextStyle(
                  color:
                      Type != BottonType.outlinedeisable ? null : Colors.green,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Type != BottonType.outlinedeisable
                    ? null
                    : Theme.of(context).unselectedWidgetColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: Type != BottonType.outlinedeisable
                      ? getMaterialColor(Color(0xff4C8613))
                      : Theme.of(context).unselectedWidgetColor,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPress,
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    Type == BottonType.Cancel ? Color(0xffFF0000) : null,
                backgroundColor: Type == BottonType.Elevated
                    ? getMaterialColor(Color(0xff4C8613))
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(343.w, isbig? 60.h:30.h),
              ),
            ),
    );
  }
}
