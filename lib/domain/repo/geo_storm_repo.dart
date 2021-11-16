import 'package:clean_arch_test/data/entity/geo_storm_dto.dart';
import 'package:clean_arch_test/data/service/nasa_service.dart';

import '../entity/geo_storm.dart';

abstract class GeoStormRepo {
  Future<List<GeoStorm>> getStorms({
    required DateTime from,
    required DateTime to,
  });
}
