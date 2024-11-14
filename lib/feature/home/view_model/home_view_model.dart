import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/service/interface/authenction_operation.dart';

/// Manage your home view business logic
final class HomeViewModel extends Cubit<HomeState> {
  /// [AuthenticationOperation] service
  HomeViewModel({required AuthenticationOperation operationService})
      : _authenticationOperation = operationService,
        super(const HomeState(isLoading: false));

  late final AuthenticationOperation _authenticationOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  ///Get users
  void fetchUsers() async {
    final response = await _authenticationOperation.users();
    emit(state.copyWith(users: response));
  }
}
