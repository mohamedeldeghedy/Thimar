import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/cache_helper.dart';
import 'package:thimar/core/kiwi.dart';
import 'package:thimar/screens/auth/splash/view.dart';
import 'package:thimar/shared/res/colors.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initKiwi();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    saveLocale: true,
    assetLoader: const CodegenLoader(),
    startLocale: const Locale('ar'),
    supportedLocales: const [Locale('ar'), Locale('en')],
    path: 'assets/lang', // <-- change the path of the translation files
    fallbackLocale: const Locale('ar'),
    child: ScreenUtilInit(
        builder: (context, child) => child!,
        designSize: const Size(375, 812),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: white,
          fontFamily: 'tajawal',
          primarySwatch: buildMaterialColor(green),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed)),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(), //const AccountActivation(phone: "01027545022"),
    );
  }
}
