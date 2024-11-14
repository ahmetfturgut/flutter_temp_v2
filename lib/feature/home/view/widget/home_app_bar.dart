part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        _loading(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@immutable
class _loading extends StatelessWidget {
  const _loading();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (!state.isLoading) return const SizedBox.shrink();
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
