import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:todo_flutter/app/core/utils/extentions.dart';
import 'package:todo_flutter/app/data/models/task.dart';
import 'package:todo_flutter/app/modules/events/view.dart';
import 'package:todo_flutter/app/modules/home/controller.dart';
import 'package:todo_flutter/app/modules/home/widgets/add_card.dart';
import 'package:todo_flutter/app/modules/home/widgets/add_dialoge.dart';
import 'package:todo_flutter/app/modules/home/widgets/buildmenu_drawer.dart';
import 'package:todo_flutter/app/modules/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: controller.sideMenuKey,
      type: SideMenuType.slideNRotate,
      menu: buildMenu(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                controller.openClosedSideMenu();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
              )),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0.wp),
                      child: Text(
                        "My List",
                        style: TextStyle(
                            fontSize: 24.0.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(
                      () => GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          ...controller.tasks
                              .map(
                                (element) => LongPressDraggable(
                                  data: element,
                                  onDragStarted: () =>
                                      controller.changeDeleting(true),
                                  onDraggableCanceled: (
                                    _,
                                    __,
                                  ) =>
                                      controller.changeDeleting(false),
                                  onDragEnd: (_) =>
                                      controller.changeDeleting(false),
                                  feedback: Opacity(
                                    opacity: 0.8,
                                    child: TaskCard(task: element),
                                  ),
                                  child: TaskCard(task: element),
                                ),
                              )
                              .toList(),
                          AddCard(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const EventsPage()
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: DragTarget<Task>(
          builder: (_, __, ___) {
            return Obx(
              () => FloatingActionButton(
                backgroundColor:
                    controller.deleting.value ? Colors.red : Colors.blue,
                onPressed: () {
                  if (controller.tasks.isNotEmpty) {
                    Get.to(() => AddDialog(), transition: Transition.downToUp);
                  } else {
                    EasyLoading.showInfo('Please create your task type');
                  }
                },
                child:
                    Icon(controller.deleting.value ? Icons.delete : Icons.add),
              ),
            );
          },
          onAccept: (Task task) {
            controller.deleteTask(task);
            EasyLoading.showSuccess("Delete Success");
          },
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: Obx(
            () => BottomNavigationBar(
              onTap: (int index) => controller.changeTab(index),
              currentIndex: controller.tabIndex.value,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 15.0.wp),
                    child: const Icon(Icons.apps),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 15.0.wp),
                    child: const Icon(Icons.event),
                  ),
                  label: 'Events',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
