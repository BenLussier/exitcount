import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_settings.dart';

class AppSettingsCubit extends HydratedCubit<AppSettings> {
  AppSettingsCubit() : super(AppSettings());

  @override
  AppSettings fromJson(Map<String, dynamic> json) => AppSettings(
        smGroupDistance: json['smGroupDistance'] ?? 1500,
        units: Units.values[json['units']] ?? Units.Imperial,
        useKnots: json['useKnots'] ?? true,
        topMsg: json['topMsg'] ?? 'Valid after cut or green light',
        bottomMsg: json['bottomMsg'] ?? 'Double time for large groups',
      );

  @override
  Map<String, dynamic> toJson(AppSettings state) => {
        'smGroupDistance': state.smGroupDistance ?? 1500,
        'units': state.units.index ?? Units.Imperial.index,
        'useKnots': state.useKnots ?? true,
        'topMsg': state.topMsg ?? 'Valid after cut or green light',
        'bottomMsg': state.bottomMsg ?? 'Double time for large groups',
      };

  void setSmGroupDistance(int dist) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.smGroupDistance = dist;
    emit(newState);
  }

  void setUnits(Units units) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.units = units;
    emit(newState);
  }

  void setUseKnots(bool use) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.useKnots = use;
    emit(newState);
  }

  void setTopMsg(String msg) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.topMsg = msg;
    emit(newState);
  }

  void setBottomMsg(String msg) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.bottomMsg = msg;
    emit(newState);
  }
}
