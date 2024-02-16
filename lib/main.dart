import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/res/colors.dart';
import 'package:thimar/core/logic/helper_nav_page.dart';
import 'package:thimar/firebase_options.dart';

import 'package:thimar/screens/about_us_app/veiw.dart';
import 'package:thimar/screens/add_adresse/veiw.dart';
import 'package:thimar/screens/addresses/veiw.dart';
import 'package:thimar/screens/confirm_code/veiw.dart';
import 'package:thimar/screens/create_new_password/veiw.dart';
import 'package:thimar/screens/esplah/veiw.dart';
import 'package:thimar/screens/forget_password/veiw.dart';
import 'package:thimar/screens/home/pages/home/veiw.dart';
import 'package:thimar/screens/home/view.dart';
import 'package:thimar/screens/login/veiw.dart';
import 'package:thimar/screens/privacy/veiw.dart';
import 'package:thimar/screens/profile/veiw.dart';

import 'package:thimar/screens/registar/veiw.dart';
import 'package:thimar/screens/suggestions/veiw.dart';
import 'package:thimar/screens/wallet/veiw.dart';

import 'core/logic/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => child!,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: Color(0xff4C8613),
              ),
              elevation: 0),
          fontFamily: "Tajawal",
          primarySwatch: getMaterialColor(Color(0xff4C8613)),
          unselectedWidgetColor: Color(0xffF3F3F3),
        ),
        home: PageView(
          children: [
            ProfileScreen(),
            HomeScreen(),
            HomePages(),
            WalletScreen(),
            AddAdresse(),
           
            AddressesScreen(),
            PrivacyScreen(),
            LoginScreen(),
            AboutUsAppScreen(),
            SuggestionsSecreen(),
            
            ConfirmCodeScreen(),
            EsplahScreen(),
            RegisterScreen(),
            CreateNewPasswordScreen(),
            ForgetpasswordScreen(),
          ],
        ),
      ),
    );
  }
}
