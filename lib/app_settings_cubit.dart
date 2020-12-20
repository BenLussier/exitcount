import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_settings.dart';

class AppSettingsCubit extends HydratedCubit<AppSettings> {
  AppSettingsCubit() : super(AppSettings());

  @override
  AppSettings fromJson(Map<String, dynamic> json) =>
      AppSettings(smGroupDistance: json['smGroupDistance']);

  @override
  Map<String, dynamic> toJson(AppSettings state) =>
      {'smGroupDistance': state.smGroupDistance};

  void setSmGroupDistance(int dist) {
    AppSettings newState = AppSettings();
    newState.smGroupDistance = dist;
    emit(newState);
  }
}
