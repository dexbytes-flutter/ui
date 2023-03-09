import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({Key? key}) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {

  final List<Map<String,dynamic>> items = [
    {"id":1, "name" : "India"},
    {"id":2, "name" : "UAE"}
  ];
  late String value;
  String _mySelection = "";
  /* String _mySelection = "";
  List<Map> _myJson = [{"id":0,"name":"<New>"},{"id":1,"name":"Test Practice"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          isDense: true,
          hint: const Text("Select"),
          value: _mySelection,
          onChanged: (String? newValue) {

            setState(() {
              _mySelection = newValue!;
            });

            print (_mySelection);
          },
          items: _myJson.map((Map map) {
            return DropdownMenuItem<String>(
              value: map["id"].toString(),
              child: Text(
                map["name"],
              ),
            );
          }).toList(),
        ),
      ),
    );

  }*/

  @override
  Widget build(BuildContext context) {

    /* DropdownMenuItem<String> buildMenuItem(String item)
    => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        )
    );*/

    DropdownMenuItem<String> buildMenuItem(Map map)
    => DropdownMenuItem(
        value: map["id"].toString(),
        child: Text(
          map["name"],
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        )
    );

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 160,
              height: 40,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 3),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  // value: value,
                  items: items.map(buildMenuItem).toList()
                  /*items.map((Map map) {
                      return DropdownMenuItem<String>(
                        value: map["id"].toString(),
                        child: Text(
                          map["name"],
                        ),
                      );
                    }).toList()*/,
                  onChanged: (value){
                    setState(() {
                      this.value = value!;
                      print(value);
                    });
                  },
                ),
              ),
            ),
            /* Container(
              width: 160,
              height: 40,
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 3),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value){
                      setState(() {
                        this.value = value;
                      });
                    }
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

}