import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem({ Key key, this.text }): super(key: key);
  String text;

  void handleItemPress() {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FlatButton(
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color(0xff595959)),
            ),
          ),
        ]),
        onPressed: handleItemPress,
      ),
      Divider(),
    ]);
  }
}