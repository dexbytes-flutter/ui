import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/coffee_model.dart';
import 'package:base_flutter_app/src/values/app_string.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_appbar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/common_text_field_with_error.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int selectedCoffeeNameIndex;
  const HomeScreen({
    Key? key,
    this.selectedCoffeeNameIndex = 0
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCoffeeNameIndex = 0;
  TextEditingController searchTextFieldController = TextEditingController();
  // Search field
  Widget searchTextfield(){
    return Container(
      padding: EdgeInsets.only(
        left: 20,right: 20,
      ),
      width: MediaQuery.of(context).size.width,
      child: CommonTextFieldWithError(
        controllerT: searchTextFieldController,
        borderRadius: 12,
        inputHeight: 50,
        errorMsgHeight: 22,
        autoFocus: false,
        errorLeftRightMargin: 0,
        maxCharLength: 16,
        capitalization: CapitalizationText.sentences,
        cursorColor: Colors.grey,
        enabledBorderColor: Colors.brown.shade400.withOpacity(0.7),
        focusedBorderColor: Colors.brown.shade400.withOpacity(0.7),
        backgroundColor: Colors.brown.shade400.withOpacity(0.7),
        textInputAction: TextInputAction.done,
        borderStyle: BorderStyle.none,
        inputKeyboardType: InputKeyboardTypeWithError.text,
        hintText: appString.trans(context, appString.searchTextFieldHintText),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade200,
        ),
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        inputFieldPrefixIcon: Container(
          margin: EdgeInsets.all(15),
          child: iconApps.iconImage(
              imageUrl: iconApps.searchIcon,
              iconSize: Size(20, 20),
            imageColor: Colors.grey.shade200
             ),
        ),
        contentPadding: EdgeInsets.only(left: 15,right: 15),
        onTextChange: (value) {
        },
        onEndEditing: (value) {

        },
      ),
    );
  }

  // Coffee name list view
  Widget coffeNameWidget(){
    return Container(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20,),
        scrollDirection: Axis.horizontal,
          itemCount: coffeeNameList.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  this.selectedCoffeeNameIndex = index;
                });
              },
              child: selectedCoffeeNameIndex == index ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("${coffeeNameList[index].title}",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                      color: Color(0xFFCB7642)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFCB7642)
                    ),
                  ),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("${coffeeNameList[index].title}",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent
                    ),
                  ),
                ],
              ),
            );
      }
      ),
    );
  }

  // Coffee list card view
  Widget coffeeCardList(){
    return Container(
      height: 280,
      width: 150,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.30),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(5, 5),
            ),
        ]
      ),
      child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child:  CachedNetworkImage(
              imageUrl: "https://i.pinimg.com/564x/32/ab/5a/32ab5aeda87745d71b0187d775485c77.jpg",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      statusBarColor: Colors.white,
      appBarHeight: 56,
      appBar: HomeAppBar(),
      containChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top title text
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Text("Find the best \ncoffee for you",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
          SizedBox(height: 30,),
          searchTextfield(),
          SizedBox(height: 25,),
          coffeNameWidget(),
          SizedBox(height: 25,),
          coffeeCardList(),
          SizedBox(height: 25,),
          Container(height: 50,),
          Container(height: 50,),
          Container(height: 50,),
        ],
      ),

    );
  }
}
