import 'package:flutterlocalnotification/local_notification_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  void regesterMyTask() async {
    // unigue name = > عشان لو عايز اقفل التاسك دى او اعمل اى عمليات عليها

    await Workmanager().registerPeriodicTask(
        "id 1",
        "show simple notification",
      frequency: const Duration(seconds: 15),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    regesterMyTask(); // register the task
  }

  void cancelTask({required String uniqueName}) {
    Workmanager().cancelByUniqueName(uniqueName); // The unigue name
  }

  void cancelAllTasks() {
    Workmanager().cancelAll(); // The unigue name
  }
}

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void actionTask() {
  // This is where your actual task will be performed
  // الحاجه الى هتتنفذ فى الباك جراوند
  Workmanager().executeTask(
    (taskName, inputData) {
      LocalNotificationService.showBasicNotification();
      return Future.value(true);
    },
  );
}
