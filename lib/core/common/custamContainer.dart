import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? col;
  final Widget? child;
  final double? cir;
  final bool? borders;
  final Color? borderCol;
  final bool grading;
  final VoidCallback? fun;
  final bool? shadow;
  final DecorationImage? imageDecoration;
  final EdgeInsetsGeometry? margin;

  CustomContainer({
    this.height,
    this.width,
    this.child,
    this.col,
    this.borders = false,
    this.cir = 1,
    this.borderCol = Colors.grey,
    this.grading = false,
    this.fun,
    this.shadow,
    this.imageDecoration,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: height,
        width: width,
        margin: margin, // Set margin around the container
        decoration: BoxDecoration(
          boxShadow: shadow == true
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // Shadow color
                    spreadRadius: 2, // The extent of the shadow
                    blurRadius: 3, // The blurring of the shadow
                    offset: const Offset(0, 1), // Positioning of the shadow
                  ),
                ]
              : null,
          color: grading ? null : col,
          gradient: grading
              ? const LinearGradient(
                  colors: [
                    Color(0xff4a2793),
                    Color(0xff5252b3)
                    // AppColours.gradient1,
                    // AppColours.gradient2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                )
              : null,
          border: borders == true ? Border.all(color: borderCol!) : null,
          borderRadius: BorderRadius.circular(cir!),
          image: imageDecoration, // Use the provided imageDecoration
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
