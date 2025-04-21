import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/framework/dependency_injection/inject_config.dart';


final mainController  = ChangeNotifierProvider(
    (ref) => getIt<MainController>(),
);

@injectable
class MainController extends ChangeNotifier{



  /// Keys
  GlobalKey aboutMeKey = GlobalKey();
}