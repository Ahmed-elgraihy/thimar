import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/screens/about_us_app/cubit.dart';
import 'package:thimar/screens/about_us_app/states.dart';

import '../../core/design/widgets/icon_with_sv.dart';

class AboutUsAppScreen extends StatelessWidget {
  const AboutUsAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutAppCubit(),
      child: Builder(builder: (context) {
        AboutAppCubit cubit = BlocProvider.of(context);
        cubit.getData();
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                " عن التطبيق",
                style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold),
              ),
            ),
            leadingWidth: 60.w,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: IconsWithSvg(
                iconName: "Arrow - Right 2",
                onPress: () {},
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  "assets/images/Groups 1.png",
                  width: 100.w,
                  height: 100.h,
                ),
              ),
              BlocBuilder<AboutAppCubit, AboutAppStates>(
                builder: (context, state) {
                  if (state is AboutApploading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is AboutAppSuccess) {
                    return Html(data: cubit.data ?? "");
                  }
                  return Text("error");
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
