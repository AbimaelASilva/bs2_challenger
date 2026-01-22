import 'package:flutter/widgets.dart';

class AppImagesAssets extends StatelessWidget {
  const AppImagesAssets({
    super.key,
    required this.path,
    this.width = 150,
    this.height = 150,
  });

  final String path;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
    );
  }
}
