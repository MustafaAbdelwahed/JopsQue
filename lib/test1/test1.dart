import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButton extends StatefulWidget {
  // Define the default color for the icon
  final Color defaultColor;

  const CustomIconButton({Key? key, required this.defaultColor})
      : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  // State variable to store the current color of the icon
  late Color iconColor;

  @override
  void initState() {
    super.initState();
    // Initialize the icon color with the default color
    iconColor = widget.defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Change the color when the widget is tapped
          setState(() {
            iconColor = iconColor == widget.defaultColor
                ? Colors.red // Change to the desired color
                : widget.defaultColor;
          });
        },
        child: Container(
            // color: Colors.amber,
            child: Image(
                color: iconColor,
                image: AssetImage("assets/image/icons/bezier.png"))));
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Icon Button Example'),
        ),
        body: const Center(
          child:
              CustomIconButton(defaultColor: Color.fromARGB(255, 33, 243, 44)),
        ),
      ),
    );
  }
}
