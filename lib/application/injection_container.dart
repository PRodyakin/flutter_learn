import 'package:clean_arch_test/data/service/fake_service.dart';
import 'package:clean_arch_test/feature/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/feature/authentication/repo/user_repository.dart';
import 'package:clean_arch_test/feature/timer_button/utils/ticker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initFeatures();
  initCore();
  await initExternal();
}

void initFeatures() {

  //Bloc

  //Repo
  sl.registerFactory(() => AuthenticationRepository());
  sl.registerFactory(() => UserRepository());
}

void initCore() {
  
}

Future<void> initExternal() async{
  sl.registerFactory(() => Dio());
  sl.registerFactory(() => RestClient(sl()));

  var prefs =  await SharedPreferences.getInstance();
  sl.registerFactory(() => prefs);

  sl.registerSingleton<Ticker>(Ticker());
}
