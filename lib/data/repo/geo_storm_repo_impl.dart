

import 'package:clean_arch_test/data/service/nasa_service.dart';
import 'package:clean_arch_test/domain/entity/geo_storm.dart';
import 'package:clean_arch_test/domain/repo/geo_storm_repo.dart';

import '../entity/geo_storm_dto.dart';

class GeoStormRepoImpl extends GeoStormRepo {
  final NasaService _nasaService;

  GeoStormRepoImpl(this._nasaService);

  @override
  Future<List<GeoStorm>> getStorms({required DateTime from, required DateTime to}) async {
    final List<GeoStormDTO> res = await _nasaService.getGeoStorms(from, to);
    return res.map((e) => e.toModel()).toList();
  }
}

