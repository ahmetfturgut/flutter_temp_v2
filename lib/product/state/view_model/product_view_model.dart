import 'package:architecture_template/product/state/view_model/product_state.dart';
import 'package:flutter/material.dart';

import '../base/base_cubit.dart';

/// [ProductViewModel] is a [BaseCubit] that contains the business logic for the product feature.
final class ProductViewModel extends BaseCubit<ProductState> {
  /// Constructor
  ProductViewModel() : super(const ProductState());

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
