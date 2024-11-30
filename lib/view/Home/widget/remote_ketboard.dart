import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:remote_tv/Controller/home_controller.dart';
import 'package:remote_tv/core/common/custamContainer.dart';
import 'package:remote_tv/core/utils/Themes/app_color.dart';
import 'package:remote_tv/core/utils/size_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_shapes/flutter_shapes.dart';
import 'dart:math'; // For the pi constant

class RemoteKetboard extends StatelessWidget {
  RemoteKetboard({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.sidesPadding, vertical: 10),
        child: Obx(() => controller.navigation.value == 0
            ? CustomContainer(
                width: 30.w,
                height: 11.h,
                cir: 10,
                col: AppColors.offBlack(context),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     InkWell(
                //       onTap: () {},
                //       child: Container(
                //         height: 6.h,
                //         width: double.infinity,
                //         color: Colors.transparent,
                //         child: Icon(
                //           Icons.arrow_upward,
                //           size: 17.sp,
                //           color: AppColors.grayColor,
                //         ),
                //       ),
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           width: 20.w,
                //           height: 17.h,
                //           //  color: Colors.amber,
                //           child: Icon(
                //             Icons.arrow_back,
                //             size: 17.sp,
                //             color: AppColors.grayColor,
                //           ),
                //         ),
                //         Container(
                //           width: 20.w,
                //           height: 17.h,
                //           // color: Colors.amber,
                //           child: Icon(
                //             Icons.arrow_forward,
                //             size: 17.sp,
                //             color: AppColors.grayColor,
                //           ),
                //         )
                //       ],
                //     ),
                //     Container(
                //       height: 6.h,
                //       width: double.infinity,
                //       // color: Colors.amber,
                //       child: Icon(
                //         Icons.arrow_downward,
                //         size: 17.sp,
                //         color: AppColors.grayColor,
                //       ),
                //     ),
                //   ],
                // ),
              )
            :
            //
            //
            //
            //

            //

            //
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         width: 60.w,
            //         height: 30.h,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: AppColors.backgroundColor(context),
            //           border: const GradientBoxBorder(
            //             gradient: LinearGradient(
            //                 colors: [Color(0xFF8E2DE2), Colors.blue]),
            //             width: 2,
            //           ),
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(
            //               vertical: 15.sp, horizontal: 20.sp),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               CustomContainer(
            //                 width: 30.w,
            //                 height: 6.5.h,
            //                 cir: 10,
            //                 col: Colors.transparent,
            //                 child: Icon(Icons.keyboard_arrow_up,
            //                     color: AppColors.black(context)),
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   CustomContainer(
            //                     width: 14.w,
            //                     height: 10.h,
            //                     cir: 10,
            //                     col: Colors.transparent,
            //                     child: Icon(Icons.keyboard_arrow_left,
            //                         color: AppColors.black(context)),
            //                   ),
            //                   Container(
            //                     width: 13.w,
            //                     height: 13.h,
            //                     decoration: BoxDecoration(
            //                         border: const GradientBoxBorder(
            //                           gradient: LinearGradient(colors: [
            //                             Color(0xFF8E2DE2),
            //                             Colors.blue
            //                           ]),
            //                           width: 2,
            //                         ),
            //                         shape: BoxShape.circle,
            //                         color: AppColors.backgroundColor(context),
            //                         boxShadow: [
            //                           BoxShadow(
            //                             color: Colors.black
            //                                 .withOpacity(0.2), // Shadow color
            //                             blurRadius:
            //                                 8.0, // Spread of the shadow
            //                             offset: Offset(3, 4),
            //                           )
            //                         ]),
            //                   ),
            //                   CustomContainer(
            //                     width: 14.w,
            //                     height: 10.h,
            //                     cir: 10,
            //                     col: Colors.transparent,
            //                     child: Icon(Icons.keyboard_arrow_right,
            //                         color: AppColors.black(context)),
            //                   )
            //                 ],
            //               ),
            //               CustomContainer(
            //                 width: 30.w,
            //                 height: 6.5.h,
            //                 cir: 10,
            //                 col: Colors.transparent,
            //                 child: Icon(Icons.keyboard_arrow_down,
            //                     color: AppColors.black(context)),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),

            Stack(
                children: [
                  Center(child: CircularSectorApp()),
                  Positioned(
                    left: 40.w,
                    right: 40.w,
                    bottom: 15,
                    top: 15,
                    child: Container(
                      width: 13.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [Color(0xFF8E2DE2), Colors.blue]),
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                          color: AppColors.offBlack(context),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 8.0, // Spread of the shadow
                              offset: Offset(3, 4),
                            )
                          ]),
                    ),
                  )
                ],
              ))
        //
        );
  }
}

// class CircularSectorApp extends StatefulWidget {
//   @override
//   _CircularSectorAppState createState() => _CircularSectorAppState();
// }

// class _CircularSectorAppState extends State<CircularSectorApp> {
//   int? activeSector;
//   final List<VoidCallback> onTapFunctions = [
//     () => print("Sector 0 tapped!"),
//     () => print("Sector 1 tapped!"),
//     () => print("Sector 2 tapped!"),
//     () => print("Sector 3 tapped!"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60.w,
//       height: 30.h,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: AppColors.backgroundColor(context),
//         border: const GradientBoxBorder(
//           gradient: LinearGradient(colors: [Color(0xFF8E2DE2), Colors.blue]),
//           width: 2,
//         ),
//       ),
//       child: GestureDetector(
//         onTapDown: (details) {
//           final sectorIndex = _determineSector(details.localPosition, context);
//           if (sectorIndex != null) {
//             setState(() {
//               activeSector = sectorIndex;
//             });
//             onTapFunctions[
//                 sectorIndex](); // Call the function for the tapped sector
//           }
//         },
//         child: CustomPaint(
//           size: Size(200, 200),
//           painter: CircularSectorPainter(activeSector: activeSector),
//         ),
//       ),
//     );
//   }

//   int? _determineSector(Offset localPosition, BuildContext context) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final Offset center = renderBox.size.center(Offset.zero);
//     final Offset touchPosition = localPosition - center;

//     double angle = atan2(touchPosition.dy, touchPosition.dx);
//     angle = (angle < -pi / 4) ? angle + 2 * pi : angle; // Normalize angle

//     // Check which sector was tapped
//     for (int i = 0; i < 4; i++) {
//       if (angle >= (-pi / 4) + (i * (pi / 2)) &&
//           angle < (-pi / 4) + ((i + 1) * (pi / 2))) {
//         return i;
//       }
//     }
//     return null;
//   }
// }

// class CircularSectorPainter extends CustomPainter {
//   final int? activeSector;

//   CircularSectorPainter({required this.activeSector});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2.5;

//     // Define default colors for sectors
//     final List<Color> sectorColors = [
//       Colors.red.withOpacity(0.8),
//       Colors.green.withOpacity(0.8),
//       Colors.blue.withOpacity(0.8),
//       Colors.orange.withOpacity(0.8),
//     ];

//     for (int i = 0; i < 4; i++) {
//       final color = (activeSector == i)
//           ? const Color.fromARGB(255, 177, 174, 174)
//           : Colors.transparent; //sectorColors[i];

//       // Draw sector
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         -pi / 4 + (i * (pi / 2)), // Adjust sector position
//         pi / 2,
//         true,
//         Paint()
//           ..color = color
//           ..style = PaintingStyle.fill,
//       );

//       // Draw arrow inside the sector
//       final arrowPaint = Paint()..color = Colors.white;
//       final arrowPath = Path();

//       // Calculate the center angle of the sector
//       final double angle = -pi / 4 + (i * (pi / 2)) + (pi / 4);

//       // Arrow dimensions
//       final double arrowLength = radius * 0.6;
//       final double arrowWidth = radius * 0.2;

//       // Points of the arrow
//       final Offset arrowTip = Offset(
//         center.dx + arrowLength * cos(angle),
//         center.dy + arrowLength * sin(angle),
//       );
//       final Offset arrowBaseLeft = Offset(
//         center.dx + (arrowLength - arrowWidth) * cos(angle - pi / 12),
//         center.dy + (arrowLength - arrowWidth) * sin(angle - pi / 12),
//       );
//       final Offset arrowBaseRight = Offset(
//         center.dx + (arrowLength - arrowWidth) * cos(angle + pi / 12),
//         center.dy + (arrowLength - arrowWidth) * sin(angle + pi / 12),
//       );

//       // Create the arrow shape
//       arrowPath.moveTo(arrowTip.dx, arrowTip.dy);
//       arrowPath.lineTo(arrowBaseLeft.dx, arrowBaseLeft.dy);
//       arrowPath.lineTo(arrowBaseRight.dx, arrowBaseRight.dy);
//       arrowPath.close();

//       // Draw the arrow
//       canvas.drawPath(arrowPath, arrowPaint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

//
//
//
//
//
//

class CircularSectorApp extends StatefulWidget {
  @override
  _CircularSectorAppState createState() => _CircularSectorAppState();
}

class _CircularSectorAppState extends State<CircularSectorApp> {
  int? activeSector;
  final List<VoidCallback> onTapFunctions = [
    () => print("Sector 0 tapped!"),
    () => print("Sector 1 tapped!"),
    () => print("Sector 2 tapped!"),
    () => print("Sector 3 tapped!"),
  ];
  void _onSectorTap(int sectorIndex) {
    setState(() {
      activeSector = sectorIndex; // Highlight sector
    });
    onTapFunctions[sectorIndex](); // Trigger sector action

    // Remove highlight after 2 seconds
    Timer(Duration(milliseconds: 200), () {
      setState(() {
        activeSector = null; // Reset to default state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 30.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.offBlack(context),
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [Color(0xFF8E2DE2), Colors.blue]),
          width: 2,
        ),
      ),
      child: GestureDetector(
        // onTapDown: (details) {
        //   final sectorIndex = _determineSector(details.localPosition, context);
        //   if (sectorIndex != null) {
        //     setState(() {
        //       activeSector = sectorIndex;
        //     });
        //     onTapFunctions[
        //         sectorIndex](); // Call the function for the tapped sector
        //   }
        // },
        onTapDown: (details) {
          final sectorIndex = _determineSector(details.localPosition, context);
          if (sectorIndex != null) {
            _onSectorTap(sectorIndex); // Highlight sector for 2 seconds
          }
        },
        child: CustomPaint(
          size: Size(200, 200),
          painter: CircularSectorPainter(activeSector: activeSector),
        ),
      ),
    );
  }

  int? _determineSector(Offset localPosition, BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset center = renderBox.size.center(Offset.zero);
    final Offset touchPosition = localPosition - center;

    double angle = atan2(touchPosition.dy, touchPosition.dx);
    angle = (angle < -pi / 4) ? angle + 2 * pi : angle; // Normalize angle

    // Check which sector was tapped
    for (int i = 0; i < 4; i++) {
      if (angle >= (-pi / 4) + (i * (pi / 2)) &&
          angle < (-pi / 4) + ((i + 1) * (pi / 2))) {
        return i;
      }
    }
    return null;
  }
}

class CircularSectorPainter extends CustomPainter {
  final int? activeSector;

  CircularSectorPainter({required this.activeSector});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.3;

    // Define default colors for sectors
    final List<Color> sectorColors = [
      Colors.red.withOpacity(0.8),
      Colors.green.withOpacity(0.8),
      Colors.blue.withOpacity(0.8),
      Colors.orange.withOpacity(0.8),
    ];

    for (int i = 0; i < 4; i++) {
      final color = (activeSector == i)
          ? const Color.fromARGB(255, 177, 174, 174)
          : Colors.transparent; //sectorColors[i];

      // Draw sector
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 4 + (i * (pi / 2)), // Adjust sector position
        pi / 2,
        true,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill,
      );

      // Draw arrow inside the sector
      final arrowPaint = Paint()..color = Colors.white;
      final arrowPath = Path();

      // Calculate the center angle of the sector
      final double angle = -pi / 4 + (i * (pi / 2)) + (pi / 4);

      // Arrow dimensions
      final double arrowLength = radius * 0.6;
      final double arrowWidth = radius * 0.2;

      // Points of the arrow
      final Offset arrowTip = Offset(
        center.dx + arrowLength * cos(angle),
        center.dy + arrowLength * sin(angle),
      );
      final Offset arrowBaseLeft = Offset(
        center.dx + (arrowLength - arrowWidth) * cos(angle - pi / 12),
        center.dy + (arrowLength - arrowWidth) * sin(angle - pi / 12),
      );
      final Offset arrowBaseRight = Offset(
        center.dx + (arrowLength - arrowWidth) * cos(angle + pi / 12),
        center.dy + (arrowLength - arrowWidth) * sin(angle + pi / 12),
      );

      // Create the arrow shape
      arrowPath.moveTo(arrowTip.dx, arrowTip.dy);
      arrowPath.lineTo(arrowBaseLeft.dx, arrowBaseLeft.dy);
      arrowPath.lineTo(arrowBaseRight.dx, arrowBaseRight.dy);
      arrowPath.close();

      // Draw the arrow
      canvas.drawPath(arrowPath, arrowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
