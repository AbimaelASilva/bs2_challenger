import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../shared/shared.dart';
import '../viewmodel/saved_viewmodel.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedViewModel>(
      create: (context) => GetIt.I<SavedViewModel>(),
      child: Scaffold(
        backgroundColor: AppColors.getBackgroundColor(context),
        appBar: AppBar(
          title: const Text('Salvos'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color:
                  AppColors.getBackgroundColor(context).withValues(alpha: 0.8),
            ),
          ),
        ),
        body: const Center(
          child: Text('Tela de Salvos'),
        ),
      ),
    );
  }
}
