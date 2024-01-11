import 'package:flutter/material.dart';

class Terst1 extends StatelessWidget {
  const Terst1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(12.0),
          child: Container(
            color: Colors.green,
            child: ListView(
              children: const <Widget>[
                ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'LATEST NEWS',
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'MARKET NEWS ',
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'MARKET REPORT',
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'LATEST NEWS',
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'MARKET NEWS ',
                    textAlign: TextAlign.center,
                  ),
                ),
                ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'MARKET REPORT',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
