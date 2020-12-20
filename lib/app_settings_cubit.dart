import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_settings.dart';

class AppSettingsCubit extends HydratedCubit<AppSettings> {
  AppSettingsCubit() : super(AppSettings());

  @override
  AppSettings fromJson(Map<String, dynamic> json) => AppSettings(
        smGroupDistance: json['smGroupDistance'] ?? 1000,
        useKnots: json['useKnots'] ?? true,
        topMsg: json['topMsg'] ?? '',
        bottomMsg: json['bottomMsg'] ?? '',
      );

  @override
  Map<String, dynamic> toJson(AppSettings state) => {
        'smGroupDistance': state.smGroupDistance,
        'useKnots': state.useKnots,
        'topMsg': state.topMsg,
        'bottomMsg': state.bottomMsg,
      };

  void setSmGroupDistance(int dist) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.smGroupDistance = dist;
    emit(newState);
  }

  void setUseKnots(bool use) {
    AppSettings newState = AppSettings(
      smGroupDistance: state.smGroupDistance,
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
      useKnots: state.useKnots,
      topMsg: state.topMsg,
      bottomMsg: state.bottomMsg,
    );
    newState.bottomMsg = msg;
    emit(newState);
  }
}
