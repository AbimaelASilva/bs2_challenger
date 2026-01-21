import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/core.dart';
import '../../../core.dart';

class FakeHorizontalList extends StatelessWidget {
  const FakeHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(
          width: AppSpacing.nano,
        ),
        itemBuilder: (BuildContext context, indexCompetition) {
          return AppDefaultCard(
            width: (AppScreenSize.width / 2) - 40,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "aaaaaaaaaaa",
                    style: AppTypografy.bodyRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const ClipRRect(
                              child: SizedBox(
                                height: 22,
                                width: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                "aaaaaaa",
                                style: AppTypografy.bodyRegular
                                    .copyWith(fontSize: AppFontSize.xxxxs),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "aaaaa",
                            style: AppTypografy.bodyRegular.copyWith(
                              fontSize: AppFontSize.xxxxs,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "a",
                            style: AppTypografy.labelRegular
                                .copyWith(fontSize: AppFontSize.xxxxs),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const ClipRRect(
                              child: SizedBox(
                                height: 22,
                                width: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                "aaa",
                                style: AppTypografy.bodyRegular.copyWith(
                                  fontSize: AppFontSize.xxxxs,
                                ),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
