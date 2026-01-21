import 'package:flutter/material.dart';
import '../../../core.dart';

void showEmojiPicker({
  required BuildContext context,
  required TextEditingController textController,
  required ScrollController scrollController,
  Function(String)? onEmojiSelected,
  VoidCallback? onBackspacePressed,
  double height = 256,
  Color backgroundColor = Colors.white,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) => SafeArea(
      child: AppPerformanceEmojis(
        onSelected: (emoji) {
          onEmojiSelected?.call(emoji);
        },
      ),

      // EmojiPicker(
      //   textEditingController: textController,
      //   scrollController: scrollController,
      //   onEmojiSelected: onEmojiSelected,
      //   onBackspacePressed: onBackspacePressed,
      //   config: Config(
      //     height: height,
      //     categoryViewConfig: CategoryViewConfig(
      //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     ),
      //     emojiViewConfig: EmojiViewConfig(
      //       // Issue: https://github.com/flutter/flutter/issues/28894
      //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //       buttonMode: ButtonMode.CUPERTINO,

      //       emojiSizeMax: 28 *
      //           (foundation.defaultTargetPlatform == TargetPlatform.iOS
      //               ? 1.2
      //               : 1),
      //     ),
      //     viewOrderConfig: const ViewOrderConfig(
      //       top: EmojiPickerItem.emojiView,
      //       middle: EmojiPickerItem.categoryBar,
      //       bottom: EmojiPickerItem.searchBar,
      //     ),
      //     searchViewConfig: SearchViewConfig(
      //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     ),
      //     bottomActionBarConfig: BottomActionBarConfig(
      //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     ),
      //   ),
      // ),
    ),
  );
}
