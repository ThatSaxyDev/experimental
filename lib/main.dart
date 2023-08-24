import 'package:experimental/features/base_nav/base_view.dart';
import 'package:experimental/responsize/screen_type_layout.dart';
import 'package:experimental/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: GoogleFonts.orbitronTextTheme(),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const ScreenTypeLayoutWrapper(
              mobile: BaseNav(),
              tablet: NoShow(),
              desktop: NoShow(),
            ),
          );
        });
  }
}

class NoShow extends StatelessWidget {
  const NoShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 'View on a mobile device'.txt(
            size: 50,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
