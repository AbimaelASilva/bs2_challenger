import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.paddingBody,
    this.paddingBottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.endDrawer,
    this.floatingActionButton,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? paddingBody;
  final EdgeInsetsGeometry? paddingBottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom + 16;
    return Scaffold(
      appBar: appBar,
      //drawer: endDrawer,
      endDrawer: endDrawer,
      body: Padding(
        padding: paddingBody ?? const EdgeInsets.all(16),
        child: body,
      ),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar != null
          ? SafeArea(
              child: Padding(
                padding: paddingBottomNavigationBar ??
                    MediaQuery.of(context).viewInsets.copyWith(
                          right: 16,
                          left: 16,
                          bottom: bottom,
                        ),
                child: bottomNavigationBar,
              ),
            )
          : null,
      floatingActionButton: floatingActionButton,
    );
  }
}
