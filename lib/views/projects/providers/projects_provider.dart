import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/projects/models/projects_model.dart';

class ProjectsProvider {
  Future<ProjectsModel?> getProjects(dynamic params) async {
    ApiRequest request = ApiRequest(
        url: RestConstants.findManyProjectsByStudent, queryParameters: params);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return ProjectsModel.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      return null;
    }
  }
}
