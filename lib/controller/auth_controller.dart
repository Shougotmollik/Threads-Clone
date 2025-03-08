import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theadsclone/routes/route_names.dart';
import 'package:theadsclone/services/storage_service.dart';
import 'package:theadsclone/services/supabase_service.dart';
import 'package:theadsclone/utils/helper.dart';
import 'package:theadsclone/utils/storage_key.dart';

class AuthController extends GetxController {
  var registerLoading = false.obs;
  var loginLoading = false.obs;
  //  **Sign up method from here ==>**

  Future<void> registration(String name, String email, String password) async {
    try {
      registerLoading.value = true;
      final AuthResponse data = await SupabaseService.client.auth
          .signUp(email: email, password: password, data: {"name": name});
      registerLoading.value = false;
      if (data != null) {
        StorageService.session
            .write(StorageKey.userSession, data.session!.toJson());
        Get.offAllNamed(RouteNames.homeScreen);
      }
    } on AuthException catch (error) {
      registerLoading.value = false;
      showSnackBar("Error", error.message);
    }
  }

//   **Login method from here ==> **

  Future<void> login(String email, String password) async {
    try {
      loginLoading.value = true;
      final AuthResponse response = await SupabaseService.client.auth
          .signInWithPassword(email: email, password: password);
      loginLoading.value = false;
      if (response.user != null) {
        StorageService.session
            .write(StorageKey.userSession, response.session!.toJson());
        Get.toNamed(RouteNames.homeScreen);
      }
    } on AuthException catch (error) {
      loginLoading.value = false;
      showSnackBar("Error", error.message);
    }
  }
}
