import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../atoms.dart';

class AppImageNetwork extends StatelessWidget {
  const AppImageNetwork({
    super.key,
    this.imageUrl,
    this.fit,
    this.height,
    this.width,
    this.borderRadius = 8,
  });

  final String? imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.isEmpty
        ? Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppAssets.images.png.iconApp.image(
                height: height ?? 32,
                width: width ?? 32,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              height: height,
              width: width,
              fit: fit,
              imageUrl: imageUrl ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: AppAssets.images.png.iconApp.image(),
                ),
              ),
              errorWidget: (context, url, error) =>
                  AppAssets.images.png.iconApp.image(height: 32, width: 32),
              imageBuilder: (context, imageProvider) {
                return Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                );
              },
            ),
          );
  }
}
