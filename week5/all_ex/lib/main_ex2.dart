import 'package:flutter/material.dart';

void main() {
  runApp((
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xffF5F5F5),
          title:const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Custom Button',                
              style: TextStyle(
                fontSize: 24    
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check),
              CustomButton(label: 'Time', icon: Icons.lock_clock, position: IconPosition.right, type: ButtonType.secondary),
              CustomButton(label: 'Account', icon: Icons.account_balance, position: IconPosition.right, type: ButtonType.disabled)
            ],
          ),
        )
      )
    )
  )
  );
}

enum IconPosition {left, right}
enum ButtonType {
  primary(Colors.blue), 
  secondary(Colors.green), 
  disabled(Colors.grey);
  
  final Color color;
  const ButtonType(this.color);
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = IconPosition.left,
    this.type = ButtonType.primary
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: type.color,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: position == IconPosition.left?
           [
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24
                ),
              )
            ]:[
              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
            ]
        )
      )
    );
  }
}