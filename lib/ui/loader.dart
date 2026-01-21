import 'package:flutter/material.dart';
import '../main_old.dart';
import 'core/core.dart';

class Loader {
  static final Loader _instance = Loader._internal();

  factory Loader() => _instance;

  Loader._internal();

  OverlayEntry? _overlayEntry;

  void show() {
    if (_overlayEntry != null) return;

    final overlayState = navigatorKey.currentState?.overlay;
    if (overlayState == null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            color: Colors.black.withAlpha(128),
            dismissible: false,
          ),
          Center(
            child: SizedBox(
              width: 130,
              height: 130,
              child: LottieEnum.random.randomAnimation,
            ),
          ),
        ],
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
