import 'package:clean_arch_test/domain/entity/solar_activities.dart';
import 'package:clean_arch_test/domain/use_case/solar_activities_use_case.dart';
import 'package:mobx/mobx.dart';
part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {

  HomeStateBase(this._useCase) {
    getSolarActivities();
  }

  final SolarActivitiesUseCase _useCase;

  @observable
  SolarActivities? solarActivities;

  @observable
  bool isLoading = false;

  @action
  Future<void> getSolarActivities() async {
    isLoading = true;
    solarActivities = await _useCase.getLastSolarActivities();
    isLoading = false;
  }
}