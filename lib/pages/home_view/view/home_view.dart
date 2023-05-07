import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/color_const.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kWhiteColor,
      key: _scaffoldKey,
      drawer: Container(
        height: 800,
        color: Colors.amber,
        width: 300.h,
        alignment: Alignment.center,
        child: Text("Salom"),
      ),
      appBar: AppBar(
        backgroundColor: ColorConst.kTransparentColor,
        leading: Container(),
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset("assets/images/menu.png"),
          )
        ],
      ),
    );
  }
}
