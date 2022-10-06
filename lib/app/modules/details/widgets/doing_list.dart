import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/core/utils/extentions.dart';
import 'package:todo_flutter/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeController.doingTodos.isEmpty &&
            homeController.doneTodos.isEmpty
        ? Column(
            children: [
              SvgPicture.asset(
                'assets/no_data_image.svg',
                width: 80.0.wp,
              ),
              SizedBox(height: 15.0.wp),
              Text(
                'Add Task',
                style:
                    TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
              )
            ],
          )
        : ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...homeController.doingTodos
                  .map((element) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0.wp, horizontal: 9.0.wp),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.grey),
                                  value: element['done'],
                                  onChanged: (value) {
                                    homeController.doneTodo(element['title']);
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                              child: Text(
                                element['title'],
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              if (homeController.doingTodos.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: const Divider(
                    thickness: 2,
                  ),
                )
            ],
          ));
  }
}
