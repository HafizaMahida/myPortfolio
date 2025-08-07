import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/framework/dependency_injection/inject_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/framework/model/about_me/about_me_model.dart';


final mainController  = ChangeNotifierProvider(
      (ref) => getIt<MainController>(),
);

@injectable
class MainController extends ChangeNotifier{

  /// Keys
  GlobalKey aboutMeKey = GlobalKey();
  GlobalKey experienceKey = GlobalKey();

  /// Scroll controller
  ScrollController scrollController = ScrollController();

  /// Navigate to pages
  void scrollToPage(GlobalKey targetKey, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox? renderBox = targetKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
        scrollController.animateTo(
          scrollController.offset + position.dy,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  int selectedExperienceIndex = 0;
  void updateExperienceIndex(int value){
    selectedExperienceIndex = value;
    notifyListeners();
  }

  /// Download resume
  void downloadFileWeb() {
    final anchor = html.AnchorElement(href: aboutMeData.resume??'https://drive.google.com/uc?export=download&id=1jolA1traAwrwt4p_3TLKBy4IFNfsq5G8')
      ..setAttribute('download', 'Hafiza Mahida Flutter Developer')
      ..click();
    anchor.remove();
  }

  /// Data and firbase call
  AboutMe aboutMeData = AboutMe();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> getFirebaseData() async{
    firestore.collection('myPortfolio').doc('about-me').get().then((querySnapshot) {
      aboutMeData = AboutMe.fromJson(querySnapshot.data()!);
      notifyListeners();
    });
  }
}
