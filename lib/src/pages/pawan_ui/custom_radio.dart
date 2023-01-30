import 'package:flutter/material.dart';

import '../../model/radio_model.dart';


class CustomRadio extends StatefulWidget {
  const CustomRadio();

  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(
        RadioModel(isSelected: false, keyLabel: 'F', textLabel: 'Flutter'));
    sampleData
        .add(RadioModel(isSelected: false, keyLabel: 'D', textLabel: 'Dart'));
    sampleData
        .add(RadioModel(isSelected: false, keyLabel: 'S', textLabel: 'Swift'));
    sampleData.add(
        RadioModel(isSelected: false, keyLabel: 'A', textLabel: 'Android'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom radio"),
      ),
      body: ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  const RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: _item.isSelected! ? Colors.blueAccent : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected! ? Colors.blueAccent : Colors.grey),
              borderRadius: _item.isSelected!
                  ? const BorderRadius.all(Radius.circular(25))
                  : const BorderRadius.all(
                      Radius.circular(10),
                    ),
            ),
            child: Center(
              child: Text(_item.keyLabel!,
                  style: TextStyle(
                      color: _item.isSelected! ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(_item.textLabel!),
          )
        ],
      ),
    );
  }
}
