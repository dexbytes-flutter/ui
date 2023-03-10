import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconApps {
  String backArrow = 'assets/images/back_arrow.svg';
  String addIcon = 'assets/images/add_icon.svg';
  String camera = 'assets/images/camera.svg';
  String gallery = 'assets/images/media.svg';
  String cameraFull = 'assets/images/camera_full.svg';
  String removePhoto = 'assets/images/remove_image.svg';
  String editProfileIcon = 'assets/images/edit_profile_icon.svg';
  String rightIcon = 'assets/images/right.svg';
  String appIcon = 'assets/images/active.svg';
  String active = 'assets/images/active.svg';
  String inActive = 'assets/images/in_active.svg';
  String swapArrow = 'assets/images/stroke.svg';
  String googlePhoto = 'assets/images/google.svg';
  String outlookPhoto = 'assets/images/outlook.svg';
  String phonePhoto = 'assets/images/phone.svg';
  String passwordIcon = 'assets/images/password_icon.svg';
  String facebookIcon = 'assets/images/facebook_icon.svg';
  String googleIcon = 'assets/images/google_icon.svg';
  String dashboardIcon = 'assets/images/dashboard_icon.svg';
  String searchIcon = 'assets/images/search_icon.svg';

  iconImage(
      {required String imageUrl,
      Size? iconSize,
      Color? imageColor,
      bool isFile = false}) {
    return isFile
        ? FileImage(
            File(imageUrl),
            scale: 1,
          )
        : (iconSize != null
            ? (imageUrl.contains(".svg")
                ? SvgPicture.asset(
                    imageUrl,
                    height: iconSize.height,
                    width: iconSize.width,
                    color: imageColor,
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    height: iconSize.height,
                    width: iconSize.height,
                    color: imageColor,
                  ))
            : (imageUrl.contains(".svg")
                ? SvgPicture.asset(
                    imageUrl,
                    color: imageColor,
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    color: imageColor,
                  )));
  }

  iconImageProvider(
      {required String imageUrl,
      Size? iconSize,
      Color? imageColor,
      bool? isFile = false}) {
    return SvgPicture.asset(
      imageUrl,
      height: iconSize?.height,
      width: iconSize?.width,
      color: imageColor,
    );
  }
}

final IconApps iconApps = IconApps();
