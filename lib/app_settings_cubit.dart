import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_settings.dart';

class AppSettingsCubit extends HydratedCubit<AppSettings> {
  AppSettingsCubit() : super(AppSettings());

  @override
  AppSettings fromJson(Map<String, dynamic> json) => AppSettings(
      smGroupDistance: json['smGroupDistance'] ?? 1000,
      showSpeed: json['showSpeed'] ?? true,
      useKnots: json['useKnots'] ?? true);

  @override
  Map<String, dynamic> toJson(AppSettings state) => {
        'smGroupDistance': state.smGroupDistance,
        'showSpeed': state.showSpeed,
        'useKnots': state.useKnots
      };

  void setSmGroupDistance(int dist) {
    AppSettings newState = AppSettings(
        smGroupDistance: state.smGroupDistance,
        showSpeed: state.showSpeed,
        useKnots: state.useKnots);
    newState.smGroupDistance = dist;
    emit(newState);
  }

  void setShowSpeed(bool show) {
    AppSettings newState = AppSettings(
        smGroupDistance: state.smGroupDistance,
        showSpeed: state.showSpeed,
        useKnots: state.useKnots);
    newState.showSpeed = show;
    emit(newState);
  }

  void setUseKnots(bool use) {
    AppSettings newState = AppSettings(
        smGroupDistance: state.smGroupDistance,
        showSpeed: state.showSpeed,
        useKnots: state.useKnots);
    newState.useKnots = use;
    emit(newState);
  }
}
