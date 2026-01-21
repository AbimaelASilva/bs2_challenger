import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimations {
  static const _basePath = 'assets/animations/lottie/';

  static String get lottie1 => '${_basePath}lottie_1.json';
  static String get lottie2 => '${_basePath}lottie_2.json';
  static String get lottie3 => '${_basePath}lottie_3.json';
  static String get lottie4 => '${_basePath}lottie_4.json';
  static String get lottie5 => '${_basePath}lottie_2.json';
}

//Lottie.asset('assets/LottieLogo1.json');

enum LottieEnum {
  random,
  lottie1,
  lottie2,
  lottie3,
  lottie4,
  lottie5,
}

extension LottieAnimationsExtension on LottieEnum {
  Widget get randomAnimation {
    final random = Random();
    final index = random.nextInt(LottieEnum.values.length);
    return LottieEnum.values[index].animation;
  }

  Widget get animation => switch (this) {
        LottieEnum.lottie1 => Lottie.asset(LottieAnimations.lottie1),
        LottieEnum.lottie2 => Lottie.asset(LottieAnimations.lottie2),
        LottieEnum.lottie3 => Lottie.asset(LottieAnimations.lottie3),
        LottieEnum.lottie4 => Lottie.asset(LottieAnimations.lottie4),
        LottieEnum.lottie5 => Lottie.asset(LottieAnimations.lottie5),
        LottieEnum.random => randomAnimation,
      };
}
