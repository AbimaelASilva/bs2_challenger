import 'package:flutter/material.dart';

import '../../../core.dart';

class AppBaseCardHorizontal extends StatelessWidget {
  const AppBaseCardHorizontal({
    super.key,
    this.imageUrl,
    required this.title,
    this.prefixSubTitle,
    this.middleSubtitle,
    this.sufixSubTitle,
    this.prefix,
  });

  final String? imageUrl;
  final String title;
  final String? prefixSubTitle;
  final String? middleSubtitle;
  final String? sufixSubTitle;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AppDefaultCard(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    _prefix(),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTypografy.bodySemi,
                          ),
                          if (prefixSubTitle != null ||
                              middleSubtitle != null ||
                              sufixSubTitle != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (prefixSubTitle != null)
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: Icon(
                                            Icons.place,
                                            color: AppColor.neutral.muted,
                                            size: 18,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            prefixSubTitle!,
                                            style: AppTypografy.bodyRegular
                                                .copyWith(
                                              color: AppColor.neutral.muted,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (middleSubtitle != null)
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: AppColor.neutral.muted,
                                                  size: 18,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  middleSubtitle!,
                                                  style: AppTypografy
                                                      .bodyRegular
                                                      .copyWith(
                                                    color:
                                                        AppColor.neutral.muted,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (sufixSubTitle != null)
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: Icon(
                                                Icons.access_time_filled_sharp,
                                                color: AppColor.neutral.muted,
                                                size: 18,
                                              ),
                                            ),
                                            Text(
                                              sufixSubTitle!,
                                              style: AppTypografy.bodyRegular
                                                  .copyWith(
                                                color: AppColor.neutral.muted,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _prefix() {
    Widget aux = const SizedBox.shrink();

    if (prefix != null) {
      aux = prefix!;
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      aux = AppContainer(
        borderRadius: BorderRadius.circular(50),
        padding: const EdgeInsets.all(2),
        width: 42,
        height: 42,
        child: AppImageNetwork(
          imageUrl: imageUrl,
          borderRadius: 50,
        ),
      );
    }
    return aux;
  }
}
