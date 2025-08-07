import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/experience/web/helper/dashed_line_painter.dart';
import 'package:portfolio/ui/theme/app_colors.dart';

class VerticalStepper extends StatelessWidget {
  final int stepCount;
  final int currentStep;
  final Function(int index) onStepTap;

  const VerticalStepper({
    super.key,
    required this.stepCount,
    required this.currentStep,
    required this.onStepTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(stepCount, (index) {
        final isActive = index == currentStep;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => onStepTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? Colors.deepPurple : Colors.white,
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                      boxShadow: isActive
                          ? [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                          : [],
                    ),
                  ),
                  if (index < stepCount - 1)
                    SizedBox(
                      width: 24,
                      height: 60,
                      child: CustomPaint(
                        painter: DashedLinePainter(
                          color: Colors.deepPurple.withOpacity(0.3),
                          dashHeight: 6,
                          dashSpacing: 4,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 7,),
                Row(
                  children: [
                    Card(
                      elevation: 1,
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: CachedNetworkImage(
                        height: 35,
                          width: 40,
                          imageUrl: 'https://picsum.photos/id/237/200/300'
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kody Technolab'),
                        Text('Dec 2022 - June 20223'),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
