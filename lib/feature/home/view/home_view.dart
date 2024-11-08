import 'package:architecture_template/feature/home/view/mixin/home_view_mixin.dart';
import 'package:architecture_template/product/init/config/app_environment.dart';
import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/utility/constans/enums/locales.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  List<User> _users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        _users = await loginService.users();
        print(_users);
        setState(() {});
      }),
      appBar: const _HomeAppBar(),
      body: Column(
        children: [
          Assets.icons.icLove.svg(package: 'gen'),
          ElevatedButton(
            onPressed: () {},
            child: Text(AppEnvironmentItems.baseUrl.value),
          ),
          const Text('Change Language'),
          ElevatedButton(
            onPressed: () {
              ProductLocalization.updateLanguage(
                context: context,
                value: Locales.en,
              );
            },
            child: const Text(LocaleKeys.general_button_save).tr(),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_users[index].userId.toString()),
                      subtitle: Text(_users[index].body.toString()),
                    );
                  }))
        ],
      ),
    );
  }
}
