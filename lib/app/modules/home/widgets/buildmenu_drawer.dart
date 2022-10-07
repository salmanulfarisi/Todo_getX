import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/core/utils/extentions.dart';
import 'package:todo_flutter/app/modules/home/controller.dart';

Widget buildMenu() {
  final homeController = Get.find<HomeController>();
  return SingleChildScrollView(
    padding: EdgeInsets.all(7.0.wp),
    child: Column(
      children: [
        ListTile(
          onTap: () {
            homeController.openClosedSideMenu();
          },
          leading: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.data_usage,
            color: Colors.white,
          ),
          title: Text(
            'Report',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: Text(
            'About developer',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
      ],
    ),
  );
}
