import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/framework/extensions/context_extensions.dart';
import 'package:portfolio/ui/theme/app_colors.dart';
import 'package:portfolio/ui/web/helper/about_me.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.025),
          child: Column(
            children: [
              AboutMe(),
            ],
          ),
        ),
      ),
    );
  }
}
