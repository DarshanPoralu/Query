import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/appbar.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../components/text.dart';

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
            Header(text: "Settings", isNotifications: true),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                        fontWeight: FontWeight.w600,
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
