
import 'package:clean_arch_test/domain/entity/solar_flare.dart';

abstract class SolarFlareRepo {
  Future<List<SolarFlare>> getFlares({
    required DateTime from,
    required DateTime to,
  });
}

