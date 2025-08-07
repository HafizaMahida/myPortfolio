import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/framework/controller/main_controller.dart';
import 'package:portfolio/framework/extensions/context_extensions.dart';
import 'package:portfolio/ui/theme/app_colors.dart';
import 'package:portfolio/ui/experience/web/experience.dart';

import 'about_me/web/about_me.dart';
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final mainRead =ref.read(mainController);
    SchedulerBinding.instance.addPostFrameCallback((callback) async{
     await  mainRead.getFirebaseData();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        elevation: 1,
        shadowColor: AppColors.clr696969.withAlpha(1),
        actions: [
          InkWell(
              onTap: (){
                ref.read(mainController).scrollToPage(ref.read(mainController).aboutMeKey,context);
              },
              child: Text('Hafiza')),
          Text('Hafiza'),
          InkWell(
              onTap: (){
                ref.read(mainController).scrollToPage(ref.read(mainController).experienceKey,context);
              },
              child: Text('Muskan'),
          ),
          Text('Shabbir'),
        ],
      ),
      body: SingleChildScrollView(
        controller: ref.read(mainController).scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.025),
          child: Column(
            children: [
              AboutMe(),
              ExperiencePage(),
            ],
          ),
        ),
      ),
    );
  }
}
