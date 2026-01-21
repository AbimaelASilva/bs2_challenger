import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core.dart';
import '../../../localization/localization.dart';

class AppScaffoldCreateEdit extends StatelessWidget {
  const AppScaffoldCreateEdit({
    super.key,
    required this.title,
    required this.urlBackgroundImage,
    required this.bodyForm,
    this.onPressedSave,
    this.labelBottomButton,
    this.bottomNavigationBar,
    this.onPressedEditImage,
    this.showProfileImage = true,
  });

  final String title;
  final String urlBackgroundImage;
  final Widget bodyForm;
  final Function? onPressedSave;
  final Function? onPressedEditImage;
  final String? labelBottomButton;
  final Widget? bottomNavigationBar;
  final bool showProfileImage;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(title, style: AppTypografy.h2),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showProfileImage)
              Center(
                child: Stack(
                  children: [
                    AppContainer(
                      borderRadius: BorderRadius.circular(50),
                      padding: const EdgeInsets.all(2),
                      width: 103,
                      height: 103,
                      child: AppImageNetwork(
                        imageUrl: urlBackgroundImage,
                        borderRadius: 50,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: AppIconButton.primary(
                        icon: Icons.image,
                        onPressed: onPressedEditImage,
                      ),
                    ),
                  ],
                ),
              ),
            bodyForm,
          ],
        ),
      ),
      //   bottomNavigationBar: bottomNavigationBar,
      bottomNavigationBar: bottomNavigationBar ??
          AppButton.primary(
            label: labelBottomButton ?? context.tr.app.save,
            onPressed: onPressedSave,
          ),
    );
  }
}
