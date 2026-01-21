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

      if (difference.inSeconds >= 20) {
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
    if (isClosed || state.isLoading) return;

    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      await userRepository.getRandonUser();

      final allLocalUsers = await userRepository.getLocalUsers();

      if (!isClosed) {
        final filtered = _filterUsers(allLocalUsers, state.searchQuery);
        emit(
          state.copyWith(
            users: allLocalUsers,
            filteredUsers: filtered,
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    }
  }

  Future<void> loadLocalUsers() async {
    if (isClosed) return;

    try {
      final allLocalUsers = await userRepository.getLocalUsers();

      if (!isClosed) {
        final filtered = _filterUsers(allLocalUsers, state.searchQuery);
        emit(
          state.copyWith(
            users: allLocalUsers,
            filteredUsers: filtered,
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

  Future<void> deleteAllUsers() async {
    if (isClosed) return;

    try {
      await userRepository.deleteAllUsers();

      if (!isClosed) {
        emit(
          state.copyWith(
            users: [],
            filteredUsers: [],
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

  void filterUsers(String query) {
    if (isClosed) return;

    final filtered = _filterUsers(state.users, query);
    emit(
      state.copyWith(
        filteredUsers: filtered,
        searchQuery: query,
      ),
    );
  }

  List<UserEntity> _filterUsers(List<UserEntity> users, String query) {
    if (query.isEmpty) {
      return users;
    }

    final lowerQuery = query.toLowerCase();
    return users.where((user) {
      final fullName = '${user.name.first} ${user.name.last}'.toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();
  }
}
