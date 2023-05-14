import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/constants/color_const.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Permission permission = Permission.storage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.kWhiteColor,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ColorConst.kTransparentColor,
        ),
        body: Container(
          height: 800,
          width: 385,
          // color: Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              image(),
              space(),
              title(),
              space(),
              info(),
              space(),
              downloadButton(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60.h,
          child: Row(
            children: [
              buttons(child: Icon(Icons.home), index: 1),
              buttons(child: Icon(Icons.cast_for_education), index: 2),
              buttons(child: Icon(Icons.work), index: 3),
              buttons(child: Icon(Icons.person_2_outlined), index: 4)
            ],
          ),
        ));
  }

  Expanded buttons({required Widget child, required int index}) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.red,
        onTap: () {
        
          debugPrint(index.toString());
        },
        child: SizedBox(
          height: 100,
          width: 100,
          child: child,
        ),
      ),
    );
  }

  SizedBox space() {
    return SizedBox(
      height: 30.h,
    );
  }

  CircleAvatar image() {
    return CircleAvatar(
      foregroundColor: ColorConst.kImageBackgroundColor,
      radius: 90.r,
      backgroundColor: ColorConst.kImageBackgroundColor,
      child: CircleAvatar(
        backgroundImage: const AssetImage(
          "assets/images/bgimage.jpg",
        ),
        radius: 85.r,
      ),
    );
  }

  Column title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hi,I am Nodirbek.",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Text info() {
    return Text(
      "Hello ! My fullname is Nodirbek Rasuljonov and I am a Flutter Developer :\n- Flutter,\n- Dart,\n- Bloc,\n- Hive,\n- Firebase and etc.",
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorConst.kTextColor,
      ),
    );
  }

  ElevatedButton downloadButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: ColorConst.kButtonColor,
        fixedSize: Size(250.w, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: () async {
        debugPrint("start");
        debugPrint("finish");
      },
      child: Text(
        "Download Resume",
        style: TextStyle(
          color: ColorConst.kTextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

Future downloadFile(String url, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File("${appStorage.path}/$name");
}
