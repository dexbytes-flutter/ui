import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../image_res/iconApp.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key,}) : super(key: key);
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int activeIndex = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }



  final tutorialModelList = [

    TutorialModel(
      imageUrl:  'https://images.unsplash.com/photo-1523810804307-760585ed63cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aW5kb25lc2lhJTIwYmVhY2h8ZW58MHx8MHx8&w=1000&q=80',
      title: 'Explore the \nbeauty of the \nworld !',
    ),
    TutorialModel(
      imageUrl: 'https://wallpaperbat.com/img/360593-stunning-indonesia-picture.jpg',
      title: 'Enjoy \nyour travel \nexperience',
    ),
    TutorialModel(
      imageUrl:  'https://i.pinimg.com/474x/78/42/ac/7842ac73d48cc8c2df9b2dcd3aa1c212.jpg',
      title: "Let's make \nyour dream \ntravel",
    ),
  ];


  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    void _scrollToIndex(int index) {
      _pageController.animateToPage(index, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
    }

    bottomButton(){
      return Container(
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          // height: 50,
          // width: 100,
          padding: EdgeInsets.only(left: 20,right: 20).copyWith(top: 4,bottom: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: appColors.buttonBgColor
          ),
          child: InkWell(
            onTap: (){
              print('Hello');
              if ( activeIndex == 2 ) {
                /*   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                  return SignInScreen();
                }), (route) => false);*/
              }else{
                activeIndex = activeIndex+1;
                _scrollToIndex(activeIndex);
              }
            },
            child: Container(
                padding: EdgeInsets.all(12),
                child: activeIndex == 2
                    ? Center(child: Text(appString.trans(context, appString.signUpButtonText),
                  style: appStyles.appButtonTextStyle(),
                ))
                    : iconApps.iconImage(
                  imageUrl: iconApps.rightArrow,
                  imageColor: appColors.textNormalColor1,
                  iconSize: Size(20, 20)
                )
            ),
          )
      );
    }

    Widget slideItem(int index) => Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: tutorialModelList[index].imageUrl,
          fit:BoxFit.fill,
          height: appDimens.heightFullScreen(),
          width: appDimens.widthFullScreen(),
        ),
        Positioned(
          bottom: 130,
          left: 20,
          child: Text(
            tutorialModelList[index].title,
            style: appStyles.sliderTextStyle(),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 110,
          child: AnimatedSmoothIndicator(
              activeIndex:activeIndex,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight:3,
                dotWidth: 15,
                activeDotColor: appColors.buttonBgColor,
                dotColor: appColors.buttonBgColor.withOpacity(0.40),

              )),
        ),
      ],
    );

    Widget pageBuilder(){
      return Container(
        height: appDimens.heightFullScreen(),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          // onPageChanged: _onPageChanged,
          onPageChanged: (index) =>
              setState(() => activeIndex = index),

          itemCount: tutorialModelList.length,
          itemBuilder: (ctx, index) => slideItem(index),
        ),
      );
    }

      return ContainerFirst(
        isOverLayStatusBar: true,
        isOverLayAppBar: true,
        contextCurrentView: context,
        appBackgroundColor: Colors.white,
        isSingleChildScrollViewNeed: false,
        isFixedDeviceHeight: true,
        appBarHeight: -1,
        appBar: Container(),
        containChild: ShaderMask(
          shaderCallback: (rectangle) =>LinearGradient(
            colors: [appColors.black.withOpacity(0.25),appColors.appBgColorJungleGreen.withOpacity(0.60)],
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height)),
          blendMode: BlendMode.darken,
          child: Stack(
            children: [
              pageBuilder(),
              Positioned(
                  bottom: 10,right: 10,
                  child: bottomButton()
              )
            ],
          ),
        ),
      );
    }
  }

class TutorialModel {
  final String imageUrl;
  final String title;

  TutorialModel({
    required this.imageUrl,
    required this.title,
  });
}