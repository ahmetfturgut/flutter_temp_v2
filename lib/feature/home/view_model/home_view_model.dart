import 'package:architecture_template/feature/home/view_model/state/home_state.dart';

import '../../../product/service/interface/authenction_operation.dart';
import '../../../product/state/base/base_cubit.dart';

/// Manage your home view business logic
final class HomeViewModel extends BaseCubit<HomeState> {
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
