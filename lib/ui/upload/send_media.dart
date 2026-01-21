import 'dart:io';

import 'package:flutter/material.dart';

import '/core/helpers/app_image_picker.dart';
import '/ui.dart';
import '/ui/core/core.dart';
import '../core/localization/localization.dart';

class SendMedia extends StatefulWidget {
  const SendMedia({
    super.key,
    required this.cubit,
  });

  final HomeController cubit;

  @override
  State<SendMedia> createState() => _SendMediaState();
}

class _SendMediaState extends State<SendMedia> {
  final List<File> _selectedMedia = [];
  final _imagePicker = AppImagePicker();
  bool _isLoading = false;

  Future<void> _pickImages() async {
    setState(() => _isLoading = true);
    try {
      final images = await _imagePicker.pickMultiImage();
      if (images != null) {
        setState(() {
          _selectedMedia.addAll(images.map((xFile) => File(xFile.path)));
        });
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pickVideo() async {
    setState(() => _isLoading = true);
    try {
      final video = await _imagePicker.pickVideo();
      if (video != null) {
        setState(() {
          _selectedMedia.add(File(video.path));
        });
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _removeMedia(int index) {
    setState(() {
      _selectedMedia.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(context.tr.app.groups, style: AppTypografy.h2),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_selectedMedia.isNotEmpty)
            TextButton(
              onPressed: () {
                // TODO: Implement post functionality
                Navigator.pop(context);
              },
              child: Text(
                context.tr.app.save,
                style: AppTypografy.buttonSecondary.copyWith(
                  color: AppColor.primary.medium,
                ),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: _selectedMedia.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_library_outlined,
                              size: 64,
                              color: AppColor.neutral.state,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              context.tr.app.availableSoon,
                              style: AppTypografy.bodyRegular.copyWith(
                                color: AppColor.neutral.state,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: _selectedMedia.length,
                        itemBuilder: (context, index) {
                          final media = _selectedMedia[index];
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  media,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () => _removeMedia(index),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.black
                                          .withAlpha((0.5 * 255).toInt()),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.1 * 255).toInt()),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _MediaButton(
                      icon: Icons.photo_library,
                      label: context.tr.app.groups,
                      onTap: _pickImages,
                    ),
                    _MediaButton(
                      icon: Icons.videocam,
                      label: context.tr.app.groups,
                      onTap: _pickVideo,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isLoading)
            ColoredBox(
              color: Colors.black.withAlpha((0.3 * 255).toInt()),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

class _MediaButton extends StatelessWidget {
  const _MediaButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColor.primary.lightest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.primary.medium,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTypografy.buttonSecondary.copyWith(
                color: AppColor.primary.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
