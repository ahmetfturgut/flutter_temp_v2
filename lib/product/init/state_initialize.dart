import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/container/product_state_items.dart';
import '../state/view_model/product_view_model.dart';

/// [StateInitialize] is a class that initializes the state of the product feature.
final class StateInitialize extends StatelessWidget {
  /// Constructor
  const StateInitialize({required this.child, super.key});

  /// [child] is the child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        ),
      ],
      child: child,
    );
  }
}
