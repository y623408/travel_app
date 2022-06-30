import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 120,right:20),
      width: 300,//double.maxFinite,
      child: Center(
        child: InkWell(
            onTap: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
          child: ResponsiveButton(
            isResponsive: true,
            content: "Exit"
          ),
        )
      ),
    );
  }
}
