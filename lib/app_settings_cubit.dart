import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_settings.dart';

class AppSettingsCubit extends HydratedCubit<AppSettings> {
  AppSettingsCubit()
      : super(AppSettings(
          smGroupDistance: 1500,
          units: Units.Imperial,
          useKnots: true,
          topMsg: 'ONLY Vaild @ Green Light',
          middleMsg: 'Lg Groups (6+) 1.5x Time',
          bottomMsg: 'Big Ways (10+) 2x Time',
        ));

  @override
  AppSettings fromJson(Map<String, dynamic> json) => AppSettings(
        smGroupDistance: json['smGroupDistance'] ?? 1500,
        units: Units.values[json['units'] ?? Units.Imperial],
        useKnots: json['useKnots'] ?? true,
        topMsg: json['topMsg'] ?? 'ONLY Vaild @ Green Light',
        middleMsg: json['middleMsg'] ?? 'Lg Groups (6+) 1.5x Time',
        bottomMsg: json['bottomMsg'] ?? 'Big Ways (10+) 2x Time',
      );

  @override
  Map<String, dynamic> toJson(AppSettings state) => {
        'smGroupDistance': state.smGroupDistance,
        'units': state.units?.index,
        'useKnots': state.useKnots,
        'topMsg': state.topMsg,
        'middleMsg': state.middleMsg,
        'bottomMsg': state.bottomMsg,
      };

  void setSmGroupDistance(int dist) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      middleMsg: state.middleMsg,
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
      middleMsg: state.middleMsg,
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
      middleMsg: state.middleMsg,
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
      middleMsg: state.middleMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.topMsg = msg;
    emit(newState);
  }

  void setMiddleMsg(String msg) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      middleMsg: state.middleMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.middleMsg = msg;
    emit(newState);
  }

  void setBottomMsg(String msg) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      units: state.units,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      middleMsg: state.middleMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.bottomMsg = msg;
    emit(newState);
  }
}
