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

  ReceivePort receivePort = ReceivePort();
  int progressvalue = 0;
  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, "donwloading file");
    receivePort.listen((message) {
      setState(() {
        progressvalue = message;
      });
    });
    FlutterDownloader.registerCallback(downloadCallBack);
    // TODO: implement initState
    super.initState();
  }

  static downloadCallBack(id, status, progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");
    sendPort!.send(progress);
  }

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
        child: const Text("Salom"),
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
        final directory = await getApplicationDocumentsDirectory();
        final taskId = await FlutterDownloader.enqueue(
          url: 'assets/pdf/NodirbekRasuljonov.pdf',
          savedDir: directory.path,
          fileName: 'NodirbekRasuljonov.pdf',
          showNotification: true,
          openFileFromNotification: true,
        );
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
