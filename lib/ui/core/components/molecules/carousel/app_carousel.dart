import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppCarouel extends StatefulWidget {
  const AppCarouel({
    required this.items,
    this.height = 200,
    this.autoPlay = true,
    this.showCounter = true,
    this.enlargeCenterPage = false,
    this.onTap,
    super.key,
  });

  final List<Widget> items;
  final double height;
  final bool autoPlay;
  final bool showCounter;
  final bool enlargeCenterPage;
  final Function? onTap;

  @override
  State<AppCarouel> createState() => _AppCarouelState();
}

class _AppCarouelState extends State<AppCarouel> {
  final carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        autoPlay: true,
        enlargeCenterPage: widget.enlargeCenterPage,
        viewportFraction: widget.enlargeCenterPage ? 0.4 : 0.5,
      ),
      items: widget.items,
    );
  }
}
