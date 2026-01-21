import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../core/localization/localization.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.controller});

  final LoginCubit controller;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (context) => controller,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              AppNavigation.of(context).home();
            } else if (state.status.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: context.tr.signUp.user,
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration:
                      InputDecoration(labelText: context.tr.signUp.password),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                const Text('Credenciais:'),
                const Text('user: johnd'),
                const Text(r'password: m38rmF$'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.login(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                  child: Text(context.tr.signUp.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
