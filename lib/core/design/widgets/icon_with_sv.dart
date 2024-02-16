import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconsWithSvg extends StatelessWidget {
  final String iconName;
  final VoidCallback onPress;

  const IconsWithSvg(
      {super.key, required this.iconName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xff4C8613).withOpacity(.13)),
      child: IconButton(
        onPressed: onPress,
        icon: SvgPicture.asset(
          "assets/icons/svg/${iconName}.svg",
        ),
      ),
    );
  }
}
