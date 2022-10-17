import 'package:get_it/get_it.dart';
import 'package:triple_example/home/store/home_repository.dart';
import 'package:triple_example/home/store/home_store.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt
    ..registerSingleton(HomeRepository())
    ..registerSingleton(HomeStore(getIt<HomeRepository>()));
}
