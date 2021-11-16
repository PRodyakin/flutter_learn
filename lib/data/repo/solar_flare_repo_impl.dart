

import 'package:clean_arch_test/data/service/nasa_service.dart';
import 'package:clean_arch_test/data/entity/solar_flare_dto.dart';
import 'package:clean_arch_test/domain/entity/solar_flare.dart';
import 'package:clean_arch_test/domain/repo/solar_flare_repo.dart';

class SolarFlareRepoImpl extends SolarFlareRepo {
  final NasaService _nasaService;

  SolarFlareRepoImpl(this._nasaService);

  @override
  Future<List<SolarFlare>> getFlares({required DateTime from, required DateTime to}) async {
    final List<SolarFlareDTO> res = await _nasaService.getFlares(from, to);
    return res.map((e) => e.toModel()).toList();
  }
}