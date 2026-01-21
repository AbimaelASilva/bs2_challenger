import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/scheduler.dart';

import '../../../domain/domain.dart';

part 'home_viewmodel_state.dart';

class _TickerProviderImpl implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({required this.userRepository})
      : _tickerProvider = _TickerProviderImpl(),
        super(const HomeViewModelState());

  final IUserRepository userRepository;
  final _TickerProviderImpl _tickerProvider;
  Ticker? _ticker;
  DateTime? lastRequestTime;

  void startPeriodicRequest() {
    lastRequestTime = DateTime.now();
    getRandonUser();
    _ticker = _tickerProvider.createTicker((elapsed) {
      final now = DateTime.now();
      final difference = now.difference(lastRequestTime!);

      if (difference.inSeconds >= 5) {
        lastRequestTime = now;
        if (!isClosed) {
          getRandonUser();
        }
      }
    });
    _ticker?.start();
  }

  @override
  Future<void> close() {
    _ticker?.stop();
    _ticker?.dispose();
    return super.close();
  }

  Future<void> getRandonUser() async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      await userRepository.getRandonUser();

      final allLocalUsers = await userRepository.getLocalUsers();

      if (!isClosed) {
        emit(
          state.copyWith(
            users: allLocalUsers,
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    } finally {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  Future<void> deleteAllUsers() async {
    if (isClosed) return;

    try {
      await userRepository.deleteAllUsers();

      if (!isClosed) {
        emit(
          state.copyWith(
            users: [],
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(error: e.toString()));
      }
    }
  }
}
