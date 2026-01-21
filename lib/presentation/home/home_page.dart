import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/core/localization/localization.dart';
import '../../ui/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.onChangeLocale, this.currentLocale});

  final void Function(Locale locale)? onChangeLocale;
  final Locale? currentLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Home')),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(top: 8),
            children: [
              ListTile(
                leading: const Icon(Icons.map),
                title: Text(context.tr.map.menuMap),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: Text(context.tr.map.menuPlantsList),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.import_export),
                title: Text(context.tr.map.menuImportExport),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(context.tr.map.menuSettings),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  context.tr.map.menuLanguage,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<Locale>(
                  value: currentLocale ?? const Locale('en'),
                  items: const [
                    DropdownMenuItem(
                        value: Locale('en'), child: Text('English')),
                    DropdownMenuItem(
                        value: Locale('es'), child: Text('Español')),
                    DropdownMenuItem(
                        value: Locale('pt'), child: Text('Português')),
                  ],
                  onChanged: (locale) {
                    if (locale != null) {
                      onChangeLocale?.call(locale);
                    }
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(context.tr.map.menuAbout),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'addPlant',
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          Builder(
            builder: (context) {
              return FloatingActionButton(
                heroTag: 'menu',
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu),
              );
            },
          ),
        ],
      ),
    );
  }
}
