import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomepageCommonImage extends StatelessWidget {
  const HomepageCommonImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: CachedNetworkImage(
            imageUrl: "https://images.unsplash.com/photo-1523810804307-760585ed63cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aW5kb25lc2lhJTIwYmVhY2h8ZW58MHx8MHx8&w=1000&q=80",
            fit:BoxFit.cover,
            height: appDimens.heightFullScreen()/2,
            width: appDimens.widthFullScreen()/1.5,
          ),
        )
      ],
    );
  }
}
