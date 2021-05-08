import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_settings.dart';

class AppSettingsCubit extends HydratedCubit<AppSettings> {
  AppSettingsCubit()
      : super(AppSettings(
          smGroupDistance: 1500,
          units: Units.Imperial,
          useKnots: true,
          topMsg: 'Valid ONLY after cut or green light',
          bottomMsg: 'Add time for large groups (6+)',
        ));

  @override
  AppSettings fromJson(Map<String, dynamic> json) => AppSettings(
        smGroupDistance: json['smGroupDistance'],
        units: Units.values[json['units']],
        useKnots: json['useKnots'],
        topMsg: json['topMsg'],
        bottomMsg: json['bottomMsg'],
      );

  @override
  Map<String, dynamic> toJson(AppSettings state) => {
        'smGroupDistance': state.smGroupDistance,
        'units': state.units?.index,
        'useKnots': state.useKnots,
        'topMsg': state.topMsg,
        'bottomMsg': state.bottomMsg,
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

  void setUnits(Units? units) {
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
