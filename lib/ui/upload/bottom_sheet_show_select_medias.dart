import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';



import '/ui/core/core.dart';
import '../../core/core.dart';

class BottomSheetShowSelectMedias extends StatefulWidget {
  const BottomSheetShowSelectMedias({
    super.key,
    required this.onPost,
  });

  final Future<void> Function(List<File> media, String text) onPost;

  @override
  State<BottomSheetShowSelectMedias> createState() =>
      _BottomSheetShowSelectMediasState();
}

class _BottomSheetShowSelectMediasState
    extends State<BottomSheetShowSelectMedias> {
  final List<File> _selectedMedia = [];
  final Map<String, String> _videoThumbnails = {};
  final _imagePicker = AppImagePicker();
  final _textController = TextEditingController();
  bool _isLoading = false;

 

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {});
    });
  }

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
        final videoFile = File(video.path);
        setState(() {
          _selectedMedia.add(videoFile);
        });

     
      }
    } catch (e) {
      if (mounted) {
        AppSnackbar().error('Erro ao selecionar vídeo: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _removeMedia(int index) {
    final media = _selectedMedia[index];
    setState(() {
      _selectedMedia.removeAt(index);
      final thumbnail = _videoThumbnails.remove(media.path);
      if (thumbnail != null) {
        try {
          File(thumbnail).deleteSync();
        } catch (e) {
          log('Error deleting thumbnail: $e');
        }
      }
    });
  }

 

  @override
  void dispose() {
    _textController.dispose();
    // Clean up thumbnail files
    for (final thumbnail in _videoThumbnails.values) {
      try {
        File(thumbnail).deleteSync();
      } catch (e) {
        log('Error deleting thumbnail in dispose: $e');
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      //color: AppColor.neutral.light,
                      ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Novo Post",
                    style: AppTypografy.h2,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            if (_selectedMedia.isNotEmpty) ...[
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedMedia.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final media = _selectedMedia[index];
                    final isVideo = media.isVideo;

                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: isVideo
                              ? _videoThumbnails[media.path] != null
                                  ? Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(_videoThumbnails[media.path]!),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.grey[300],
                                      child: const Icon(
                                        Icons.videocam,
                                        size: 32,
                                        color: Colors.grey,
                                      ),
                                    )
                              : Image.file(
                                  media,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        if (isVideo)
                          Positioned(
                            top: 4,
                            left: 4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                // color: Colors.white,
                                size: 16,
                              ),
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
                                color: Colors.black.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                // color: Colors.white,
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
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  child: AppInput.area(
                    initialValue: _textController.text,
                    label: "Como foi este futebol?",
                    maxLines: 5,
                    onChanged: (value) {
                      _textController.text = value;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                AppIconButton.primary(
                  icon: Icons.send,
                  size: 52,
                  onPressed: _isLoading || _selectedMedia.isEmpty
                      ? null
                      : () async {
                          await widget.onPost.call(
                            _selectedMedia,
                            _textController.text.trim(),
                          );
                        },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                // color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AppButton.secondary(
                        label: "Foto",
                        icon: Icons.photo_library,
                        padding: const EdgeInsets.only(left: 16),
                        onPressed: _pickImages,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppButton.secondary(
                        label: "Vídeo",
                        icon: Icons.videocam,
                        onPressed: _pickVideo,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
