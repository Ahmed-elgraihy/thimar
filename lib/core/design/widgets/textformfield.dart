import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';

enum TextfieldType { sreach, email, password, phone, normal }

class CustomTextformField extends StatefulWidget {
  final String? text;
  final String? hintText;
  final TextfieldType textfieldType;
  final String iconspath;
  final TextInputAction textInputAction;
  final int minLines;
  final TextEditingController? textEditingController;
  final isenable;

  const CustomTextformField({
    super.key,
    this.text,
    this.textfieldType = TextfieldType.normal,
    this.iconspath = "",
    this.textInputAction = TextInputAction.next,
    this.minLines = 1,
    this.textEditingController,
    this.hintText = "", this.isenable=true,
  });

  @override
  State<CustomTextformField> createState() => _CustomTextformFieldState();
}

class _CustomTextformFieldState extends State<CustomTextformField> {
  bool isPasswordhidden = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
          enabled: true,
          controller: widget.textEditingController,
          minLines: 1,
          maxLines: widget.minLines,
          textInputAction: widget.textInputAction,
          obscureText: widget.textfieldType == TextfieldType.password &&
              !isPasswordhidden,
          decoration: InputDecoration(
            labelText: widget.text,
            hintText: widget.hintText,
            fillColor: Colors.white,
            filled: true,
            icon: widget.textfieldType == TextfieldType.phone
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).unselectedWidgetColor,
                            width: 3),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Image.asset("assets/images/Rectangle 3454.png"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("966+"),
                      ],
                    ),
                  )
                : null,
            prefixIcon: widget.iconspath != null
                ? widget.iconspath.endsWith("svg")
                    ? SvgPicture.asset(
                        widget.iconspath,
                        height: 18.h,
                        width: 18.w,
                        fit: BoxFit.scaleDown,
                      )
                    : Image.asset(widget.iconspath)
                : null,
            suffixIcon: widget.textfieldType == TextfieldType.password
                ? GestureDetector(
                    onTap: () {
                      isPasswordhidden = !isPasswordhidden;
                      setState(() {});
                    },
                    child: Icon(isPasswordhidden
                        ? Icons.visibility
                        : Icons.visibility_off))
                : null,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).unselectedWidgetColor, width: 3),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).unselectedWidgetColor),
            ),
          )),
    );
  }
}
