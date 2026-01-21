import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/core.dart';
import '../../ui.dart';

class _AppBarWrapper extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarWrapper({
    required this.controller,
  });

  final HomeController controller;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<HomeController, HomeState>(
        buildWhen: (previous, current) => previous.user != current.user,
        builder: (context, state) {
          return AppCustomAppbarWidget(
            user: state.user,
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.controller..getInitialData(),
      child: AppScaffold(
        resizeToAvoidBottomInset: true,
        appBar: _AppBarWrapper(
          controller: widget.controller,
        ),
        endDrawer: BlocBuilder<HomeController, HomeState>(
          buildWhen: (previous, current) => previous.user != current.user,
          builder: (context, state) => _userProfileDrawer,
        ),
        body: const Text('Home'),
      ),
    );
  }

  Widget get _userProfileDrawer => BlocBuilder<HomeController, HomeState>(
        buildWhen: (previous, current) => previous.user != current.user,
        builder: (context, state) {
          return UserProfileDrawer(
            user: widget.controller.state.user,
            onThemeChanged: () {},
            loginStep: widget.controller.state.user.id.isEmpty
                ? () {
                    Navigator.of(context).pop();
                  }
                : null,
            myDatas: () async {
              Navigator.of(context).pop();

              await widget.controller.getInitialData();
            },
            onLogout: widget.controller.logOut,
            deleteAccount: () async {
              Navigator.of(context).pop();
              final shouldDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Lamentamos que você vai nos deixar'),
                  content: const Text(
                    'Todos os seus dados serão apagados permanentemente. Esta ação não pode ser desfeita.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Confirmar e apagar conta'),
                    ),
                  ],
                ),
              );

              if (shouldDelete != null && shouldDelete) {
                await widget.controller.logOut();
              }
            },
          );
        },
      );
}
