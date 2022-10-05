import 'package:get/get.dart';
import 'package:glint/app/data/provider/api.dart';
import 'package:glint/app/data/service/auth/repository.dart';
import 'package:glint/app/data/service/auth/service.dart';

class AppInitalizer {
  Future<void> init() async {
    await Future.wait([
      Get.putAsync(() => AuthService(AuthRepository(FGBPApiProvider())).init())
    ]);

    //Get.put<LifeCycleController>(LifeCycleController());
    // await Get.putAsync<DatabaseController>(() => DatabaseController().init());
    // await Get.putAsync<AuthController>(() => AuthController().init());
  }
}
