import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/framework/controller/main_controller.dart';
import 'package:portfolio/framework/extensions/context_extensions.dart';
import 'package:portfolio/ui/experience/web/helper/vertical_stepper.dart';
import 'package:portfolio/ui/theme/app_colors.dart';
import 'package:portfolio/ui/theme/text_style.dart';

class ExperienceModel {
  final String company;
  final String role;
  final String logoUrl; // asset or network
  final String duration;
  final String timelineDuration;
  final String companyLink;
  final List<String> responsibilities;
  final List<String> skills;

  ExperienceModel({
    required this.company,
    required this.role,
    required this.logoUrl,
    required this.duration,
    required this.timelineDuration,
    required this.companyLink,
    required this.responsibilities,
    required this.skills,
  });
}

final List<ExperienceModel> experiences = [
  ExperienceModel(
    company: "KGISL",
    role: "Associate – Full Time",
    logoUrl: "assets/kgisl_logo.png",
    duration: "Mar 2024 - Present",
    timelineDuration: "Mar 2024 - Present",
    companyLink: "https://www.kgisl.com/",
    responsibilities: [
      "Maintained and enhanced the Aditya Birla Wealth app, surpassing 100K+ downloads.",
      "Spearheaded frontend enhancements in React.js for mutual fund and digital gold features.",
      "Managed React Native version upgrades, reducing crashes by 30%.",
      "Collaborated with teams to deliver new features, boosting engagement by 20%.",
    ],
    skills: [
      "REACT NATIVE", "REACT JS", "REACT HOOKS", "REDUX", "TYPESCRIPT",
      "JAVASCRIPT", "AWS", "FIREBASE", "REST API", "PRODUCT",
      "APP DISTRIBUTION", "GIT", "PAYMENT INTEGRATION",
    ],
  ),
  // Add more ExperienceModel entries here...
];

class ExperiencePage extends ConsumerWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainWatch = ref.watch(mainController);
    return Column(
      key: mainWatch.experienceKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyles.bold.copyWith(
            color: AppColors.black,
            fontSize: 25.sp,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex:1,
                child: VerticalStepper(
                    stepCount: 3,
                    currentStep:
                    mainWatch.selectedExperienceIndex,
                    onStepTap: (index){
                      mainWatch.updateExperienceIndex(index);
                    },
                ),
            ),
            Expanded(
              flex:2,
              child:Card(
                color: AppColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Intern',
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Intern',
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Intern',
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Intern',
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Intern',
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),

                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


