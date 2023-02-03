import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/model/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeNameHorizontalList extends StatefulWidget {
  final String coffeeListTitle;
  final int index;
  final selectedCoffeeNameIndex;
  const CoffeeNameHorizontalList({
    Key? key,
    this.coffeeListTitle = "Cappuccino",
    this.index = 0,
    this.selectedCoffeeNameIndex = 0
  }) : super(key: key);

  @override
  State<CoffeeNameHorizontalList> createState() => _CoffeeNameHorizontalListState();
}

class _CoffeeNameHorizontalListState extends State<CoffeeNameHorizontalList> {


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Text(
            widget.coffeeListTitle,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: widget.selectedCoffeeNameIndex == widget.index? Color(0xFFCB7642) : Colors.grey.shade400),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.selectedCoffeeNameIndex == widget.index? Color(0xFFCB7642) : appColors.white),
        ),
      ],
    );

  }
}
