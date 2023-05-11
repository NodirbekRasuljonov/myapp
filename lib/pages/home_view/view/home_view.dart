import 'package:flutter/material.dart';
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
            CircleAvatar(
              radius: 90.r,
              backgroundColor: ColorConst.kImageBackgroundColor,
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  "assets/images/bgimage.jpg",
                ),
                radius: 85.r,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Column(
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
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Hello ! My fullname is Nodirbek Rasuljonov and I am a Flutter Developer :\n- Flutter,\n- Dart,\n- Bloc,\n- Hive,\n- Firebase and etc.",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: ColorConst.kTextColor,
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: ColorConst.kButtonColor,
                fixedSize: Size(250.w, 60.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Download Resume",
                style: TextStyle(
                  color: ColorConst.kTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
