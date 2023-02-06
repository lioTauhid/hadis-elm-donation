import 'package:elm/utils/utils.dart';
import 'package:get/get.dart';
import '../../service/api/api_client.dart';
import '../model/projects.dart';
import 'error_controller.dart';
import 'package:http/http.dart' as http;

class HomeController  extends GetxController with ErrorController {
  var projectList = [].obs;

  Future<void> getAllProjects() async {
    var response = await ApiClient()
        .get('projects')
        .catchError(handleApiError);
    projectList.value = projectListFromJson(response);
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllProjects();
  }
}