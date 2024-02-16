import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/screens/about_us_app/states.dart';

class AboutAppCubit extends Cubit<AboutAppStates> {
  AboutAppCubit() : super(AboutAppStates());
  var data;
  Future<void> getData() async {
    emit(AboutApploading());
    Response response =
        await Dio().get("https://thimar.amr.aait-d.com/public/api/about");
    print(response.data);
    data = response.data["data"]["about"];
    emit(AboutAppSuccess());
  }
}
