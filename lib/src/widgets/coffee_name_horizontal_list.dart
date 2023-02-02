import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/model/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeNameHorizontalList extends StatefulWidget {
  const CoffeeNameHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  State<CoffeeNameHorizontalList> createState() => _CoffeeNameHorizontalListState();
}

class _CoffeeNameHorizontalListState extends State<CoffeeNameHorizontalList> {

  int selectedCoffeeNameIndex = 0;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(
        ),
        scrollDirection: Axis.horizontal,
        itemCount: coffeeNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                this.selectedCoffeeNameIndex = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Text(
                    "${coffeeNameList[index].title}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedCoffeeNameIndex == index? Color(0xFFCB7642) : Colors.grey.shade400),
                  ),
                ),
               Container(
                  margin: EdgeInsets.all(5),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: selectedCoffeeNameIndex == index? Color(0xFFCB7642) : appColors.white),
                ),
              ],
            )
          );
        });
  }
}
