import 'package:flutter_bloc/flutter_bloc.dart';

/// Base cubit
abstract class BaseCubit<T extends Object> extends Cubit<T> {
  /// Base cubit constructor
  BaseCubit(super.initialState);

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
