import 'package:flutter/material.dart';
import 'package:question_and_answer/components/header2.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../../../../components/text.dart';

class Setting extends StatefulWidget {
  static String id = "setting";

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header2(text: "Settings"),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20), top: getProportionateScreenHeight(20)),
              child: Column(
                children: [
                  Transform.scale(
                    scale: 1.08,
                    child: ListTileSwitch(
                      value: status,
                      // leading: Icon(Icons.notifications),
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                      switchActiveColor: Colors.blueAccent,
                      switchType: SwitchType.material,
                      title: TextWidget(
                        text:
                        "Notifications",
                        fontSize: 16.0,
                        colorType: Colors.black,
                        fontWeight: FontWeight.w600, textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
