import 'package:flutter/material.dart';
import '../../../core.dart';

class FakeListVertical extends StatelessWidget {
  const FakeListVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox.shrink(),
      itemBuilder: (context, index) {
        return const AppBaseCardHorizontal(
          imageUrl:
              "https://img.freepik.com/vetores-gratis/projeto-do-molde-do-logotipo_1195-105.jpg",
          title: "",
          prefixSubTitle: "",
          middleSubtitle: "",
          sufixSubTitle: "",
        );
      },
    );
  }
}
