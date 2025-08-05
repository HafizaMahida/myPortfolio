import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/framework/dependency_injection/inject_config.dart';
import 'package:portfolio/ui/main_screen.dart';
import 'package:portfolio/ui/theme/app_colors.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseOptions;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAVjDSQ03j799GmGi7k31pBuxZwP9bqPMk",
          authDomain: "my-portfolio-bfff2.firebaseapp.com",
          projectId: "my-portfolio-bfff2",
          storageBucket: "my-portfolio-bfff2.firebasestorage.app",
          messagingSenderId: "875345167720",
          appId: "1:875345167720:web:77f066db7e47aed10282dd"
      )
  );
  await configureMainDependencies();
  runApp(
      ProviderScope(
          child: const MyApp()
      ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child) {
          return MaterialApp(
            title: 'Hafiza Mahida',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.black,
              primarySwatch: Colors.deepPurple,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
        home: MainScreen(),
      );
        }
    );
  }
}


