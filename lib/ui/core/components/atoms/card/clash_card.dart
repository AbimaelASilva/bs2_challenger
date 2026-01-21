import 'package:flutter/material.dart';
import '../../../../../core/core.dart';
import '../../../core.dart';

class AppClashCard extends StatelessWidget {
  final String competitionName;
  final String competitionCategory;
  final String teamALogo;
  final String teamAName;
  final String teamBLogo;
  final String teamBName;
  final String startTime;
  final String startDate;

  const AppClashCard({
    super.key,
    this.competitionName = '',
    this.competitionCategory = '',
    required this.teamALogo,
    required this.teamAName,
    required this.teamBLogo,
    required this.teamBName,
    required this.startTime,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return AppDefaultCard(
      width: (AppScreenSize.width / 2) - 40,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (competitionName.isNotEmpty)
              Text(
                "${competitionName.removeFirstWordIfCamp()} - $competitionCategory",
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
                      ClipRRect(
                        child: Image.network(
                          teamALogo,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          teamAName.abbreviateFromSecondWord,
                          style: AppTypografy.bodyRegular.copyWith(
                            fontSize: AppFontSize.xxxxs,
                          ),
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
                      startTime,
                      style: AppTypografy.bodyRegular.copyWith(
                        fontSize: AppFontSize.xxxxs,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      startDate,
                      style: AppTypografy.labelRegular.copyWith(
                        fontSize: AppFontSize.xxxxs,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.network(
                          teamBLogo,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          teamBName.abbreviateFromSecondWord,
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
  }
}
