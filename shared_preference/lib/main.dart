import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/Services_/Shared_Preference.dart';
import 'package:shared_preference/ViewModel/StoreProvider.dart';
import 'package:shared_preference/ViewModel/getProvider.dart';
import 'package:shared_preference/view_/Home_view.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Helper.initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create:(_)=> StoreProvider()),
            ChangeNotifierProvider(create:(_)=> Getprovider()),
          ],

          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Shared Preferences',
                theme: ThemeData(
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.teal),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),
              home: HomeView(),
        
                // initialRoute: Routesname.authView,
                // onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}