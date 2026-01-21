import 'package:flutter/material.dart';

class StackedGradientCard extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onTap;

  const StackedGradientCard({
    super.key,
    required this.width,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double blueWidth = width * 0.75;
    final double blueHeight = height * 0.75;

    final double yellowWidth = width * 0.5;
    final double yellowHeight = height * 0.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: blueWidth,
                height: blueHeight,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Topo - Amarelo com conteúdo
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: yellowWidth,
                height: yellowHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.yellow[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
