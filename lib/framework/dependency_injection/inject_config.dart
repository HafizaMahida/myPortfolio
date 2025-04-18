import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/framework/dependency_injection/inject_config.config.dart' show GetItInjectableX;
final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureMainDependencies() async =>
    GetItInjectableX(getIt).init();
