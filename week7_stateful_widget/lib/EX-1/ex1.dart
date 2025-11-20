import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stateful widget-Button"),
        ),
        body: Center(
          child: Column(
            children: [
              SelectButton(),
              SizedBox(height: 10),
              SelectButton(),
              SizedBox(height: 10),
              SelectButton(),
              SizedBox(height: 10),
              SelectButton()
            ],
          )
        ),
      ),
    ));

class SelectButton extends StatefulWidget{
  const SelectButton({
    super.key,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();

}

class _SelectButtonState extends State<SelectButton>{
  bool buttonSelected = false;

  Color get backgroundColor => buttonSelected ? Colors.blue[500]! : Colors.blue[50]!;
  Color get textColor => buttonSelected? Colors.white : Colors.black;
  String get buttonLabel => buttonSelected ? "Selected" : "Not Selected";

  void onSelect() {
    setState(() {
      buttonSelected = !buttonSelected;
    });
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 400,
      height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: onSelect,
          child: Center(
            child: Text(buttonLabel, style: TextStyle(color: textColor))
        )),
    );
  }
}
