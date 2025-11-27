import 'package:flutter/material.dart';
import 'package:study_project/onboarding/_export.dart';

sealed class OnboardingEvent {}

class OnIndexChanged extends OnboardingEvent {
  final int index;
  OnIndexChanged(this.index);
}

class OnboardingState {
  final int pageIndex;
  OnboardingState({required this.pageIndex});
}

class OnboardingBloc {
  // Внутреннее состояние блока
  OnboardingState _state = OnboardingState(pageIndex: 0);
  OnboardingState get state => _state;

  // Поток для состояний
  final _stateController = StreamController<OnboardingState>.broadcast();
  Stream<OnboardingState> get stream => _stateController.stream;

  // Поток для событий
  final _eventController = StreamController<OnboardingEvent>.broadcast();

  // Подписка на события
  late StreamSubscription _eventSubscription;
  OnboardingBloc() {
    _eventSubscription = _eventController.stream.listen(_mapEventToState);
  }

  // Добавление события в блок
  void add(OnboardingEvent event) {
    _eventController.add(event);
  }

  // Преобразование события в состояние
  void _mapEventToState(OnboardingEvent event) {
    switch (event) {
      case OnIndexChanged(index: final inx):
      _saveAndUpdateState(pageIndex: inx);
    }
  }

  // Сохраняем состояние в блоке и передаем его подписчикам
  void _saveAndUpdateState({required int pageIndex}) {
    final newState = OnboardingState(pageIndex: pageIndex);
    _stateController.add(newState);
    _state = newState;
  }

  // Освобождение ресурсов
  void dispose() {
    _stateController.close();
    _eventController.close();
    _eventSubscription.cancel();
  }
}
