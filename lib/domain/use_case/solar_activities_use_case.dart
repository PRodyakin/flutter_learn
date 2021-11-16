import 'package:clean_arch_test/domain/repo/solar_flare_repo.dart';

import '../entity/solar_activities.dart';
import '../repo/geo_storm_repo.dart';

class SolarActivitiesUseCase {
  final GeoStormRepo _geoStormRepo;
  final SolarFlareRepo _solarFlareRepo;

  SolarActivitiesUseCase(this._geoStormRepo, this._solarFlareRepo);

  Future<SolarActivities> getLastSolarActivities() async {
    final fromDate = DateTime.now().subtract(Duration(days: 365));
    final toDate = DateTime.now();

    final storms = await _geoStormRepo.getStorms(from: fromDate, to: toDate);
    final flares = await _solarFlareRepo.getFlares(from: fromDate, to: toDate);

    return SolarActivities(lastFlare: flares.last, lastStorm: storms.last);
  }
}
