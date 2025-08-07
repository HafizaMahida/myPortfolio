import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/framework/controller/main_controller.dart';
import 'package:portfolio/framework/extensions/context_extensions.dart';
import 'package:portfolio/ui/theme/app_colors.dart';
import 'package:portfolio/ui/theme/text_style.dart';

class AboutMe extends ConsumerWidget {
  const AboutMe({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref,) {
    final mainWatch  = ref.watch(mainController);
    return SizedBox(
      key: mainWatch.aboutMeKey,
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
                  mainWatch.aboutMeData.name??'Hafiza',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.black,
                    fontSize: 50.sp,
                  ),
                ),
                Text(
                    mainWatch.aboutMeData.description??'Description',
                  style: TextStyles.regular.copyWith(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontFamily: TextStyles.secondaryFontFamily
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
                SizedBox(
                  height: context.height*0.06,
                ),
                MouseRegion(
                  child: GestureDetector(
                    onTap: ()async{
                      /// Download resume code
                      mainWatch.downloadFileWeb();
                    },
                  
                    child: Container(
                      height:110.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.lightPrimary2,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "DOWNLOAD CV",
                            style: TextStyles.semiBold.copyWith(
                              color: AppColors.white,
                              fontSize: 13.sp,
                            ),
                          ),
                          Icon(
                            Icons.download,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
