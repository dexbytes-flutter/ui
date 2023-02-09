import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {

  int initialQuantity = 1;

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);


    void _incrementCounter() {
      setState(() {
        if (initialQuantity >= 1 && initialQuantity < 10) {
          initialQuantity++;
        }
      });
    }

    void _decrementCounter() {
     setState(() {
       if (initialQuantity > 1) {
         initialQuantity--;
       }
     });
    }

    return Center(
        child: Container(
          padding: EdgeInsets.all(4),
          width: appDimens.widthFullScreen()/3.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: appColors.appButtonBgColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    _decrementCounter();
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  )),
              SizedBox(width: 15,),
              Text(
                "$initialQuantity",
                style: appStyles.titleTextStyle1(
                  texColor: appColors.white
                ),
              ),
              SizedBox(width: 15,),
              InkWell(
                  onTap: () {
                    _incrementCounter();
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  )),
            ],
          ),
        ),
      );
    ;
  }
}
