

import 'package:flutter/material.dart';

class Util_Npk {


  static bool hasDomain(String url) => url.contains('http://') || url.contains('https://');


  static bool isNullFromJson(json, String key) =>
      json.containsKey(key) && json[key] != null;

  static dynamic getValueFromJson(json, String key, dynamic defaultValue) =>
      json.containsKey(key) && json[key] != null ? json[key] : defaultValue;

  static goToPage(context, page, funCallback) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page)).then((value) {
    if (funCallback != null) funCallback(value);});
  static goToNextPage(context, page, funCallback) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => page)).then((value) {
    if (funCallback != null) funCallback(value);
  });

  static Future<bool?> showCustomAlertDialog(BuildContext context, String message,
      {String? title, bool isActionCancel = false, double elevation = 4.0,
        Color primaryColor = Colors.white54}) {
    final List<Widget> actions = [];
    if (isActionCancel)
      actions.add(addAction(context, 'Hủy', false, Colors.grey, elevation));

    actions.add(addAction(context, 'Đồng ý', true, primaryColor, elevation));

    return showDialog(context: context, barrierDismissible: false, barrierColor: Colors.black12,
        builder: (context) => AlertDialog(actionsPadding: EdgeInsets.all(8.0),
            title: Text(title??'Thông báo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            content: Text(message, style: TextStyle(fontSize: 14)), actions: actions));
  }

  static Widget addAction(BuildContext context, String buttonName, value, Color color, double elevation) =>
      ElevatedButton(
          child: Text(buttonName, style: TextStyle(color: Colors.white, fontSize: 14)),
          onPressed: () => Navigator.of(context).pop(value is TextEditingController ? value.text : value),
          style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              elevation: MaterialStateProperty.resolveWith((states) => elevation))
      );

}
