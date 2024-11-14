import 'package:architecture_template/feature/home/view/mixin/home_view_mixin.dart';
import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template/product/init/config/app_environment.dart';
import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/utility/constans/enums/locales.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

import '../view_model/home_view_model.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          homeViewModel.fetchUsers();
        }),
        appBar: const _HomeAppBar(),
        body: const Column(
          children: [
            Expanded(
              child: _UserList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeViewModel, HomeState, List<User>>(
      selector: (state) {
        return state.users ?? [];
      },
      builder: (context, state) {
        if (state.isEmpty) return const SizedBox.shrink();
        return ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state[index].userId.toString()),
                subtitle: Text(state[index].body.toString()),
              );
            });
      },
    );
  }
}
