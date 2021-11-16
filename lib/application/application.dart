import 'package:clean_arch_test/data/repo/geo_storm_repo_impl.dart';
import 'package:clean_arch_test/data/repo/solar_flare_repo_impl.dart';
import 'package:clean_arch_test/data/service/nasa_service.dart';
import 'package:clean_arch_test/domain/repo/geo_storm_repo.dart';
import 'package:clean_arch_test/domain/repo/solar_flare_repo.dart';
import 'package:clean_arch_test/domain/use_case/solar_activities_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(
        homeState: HomeModule.homeState,
      ),
    );
  }
}

class RepoModule {
  static late final NasaService _nasaService = NasaService();
  static late GeoStormRepo geoStormRepo = GeoStormRepoImpl(_nasaService);
  static late SolarFlareRepo solarFlareRepo = SolarFlareRepoImpl(_nasaService);
}

class HomeModule {
  static late final HomeState homeState = HomeState(SolarActivitiesUseCase(
    RepoModule.geoStormRepo,
    RepoModule.solarFlareRepo,
  ));
}
