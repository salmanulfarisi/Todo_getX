import 'package:get/get.dart';
import 'package:todo_flutter/app/data/providers/task/provider.dart';
import 'package:todo_flutter/app/data/services/storage/repositery.dart';
import 'package:todo_flutter/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        tastRepositery: TastRepositery(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
