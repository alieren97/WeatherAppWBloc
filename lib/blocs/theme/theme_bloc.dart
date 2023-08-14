import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_bloc/blocs/blocs.dart';
import 'package:open_weather_bloc/constants/constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>(_changeEvent);
  }

  void _changeEvent(ChangeThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(appTheme: event.appTheme));
  }

  void setTheme(double currentTemp) {
    if (currentTemp > kWarmOrNot) {
      add(ChangeThemeEvent(appTheme: AppTheme.light));
    } else {
      add(ChangeThemeEvent(appTheme: AppTheme.dark));
    }
  }
}
