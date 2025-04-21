import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/framework/controller%20/main_controller.dart';
import 'package:portfolio/framework/extensions/context_extensions.dart';
import 'package:portfolio/ui/theme/app_colors.dart';
import 'package:portfolio/ui/theme/text_style.dart';

class AboutMe extends ConsumerWidget {
  const AboutMe({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref,) {
    final mainWatch  = ref.watch(mainController);
    return SizedBox(
     // key: mainWatch.aboutMeKey,
      height: context.height,
      width: context.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset(
              'assets/anim/home_anim.json',
              width: context.width*0.5,
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello, I'm",
                  style: TextStyles.semiBold.copyWith(
                    color: AppColors.black,
                    fontFamily: TextStyles.secondaryFontFamily,
                    fontSize: 40.sp,
                  ),
                ),
                Text(
                  "Hafiza Mahida",
                  style: TextStyles.bold.copyWith(
                    color: AppColors.black,
                    fontSize: 50.sp,
                  ),
                ),
                Text(
                  "A mobile app developer with 2 years of experience building high-quality, responsive applications for Android, iOS, and Web using Flutter, Jetpack Compose, and native platforms. Specialized in crafting seamless cross-platform experiences, with a strong focus on responsive UI, performance, and scalable architecture.",
                  style: TextStyles.regular.copyWith(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
