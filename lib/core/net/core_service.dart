
import '../../../core/net/app_urls.dart';
import '../../../core/net/constants.dart';
import '../../../core/net/http_client.dart';

class SharedService {
  final _apiRepo = BaseRepository();

   /*uploadImage(XFile image, String type) async {

    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
        filename: '${image.name}.png',
      ),
      'type':type,
    });
    var response = await _apiRepo.requestApi(
      method: APIType.POST,
      url: APIUrls.uploadImage,
      data: formData,
    );
    return response;
  }*/

  getMainCategories() async {
    var response = await _apiRepo.requestApi(
      method: APIType.GET,
      url: APIUrls.getMainCategories,
    );
    return response;
  }

/*  getChildrenCategories(int id) async {
    var response = await _apiRepo.requestApi(
      method: APIType.GET,
      url: '${APIUrls.getCategoriesChildren}/$id',
    );
    return response;
  }

  getAllPermission() async {
    var response = await _apiRepo.requestApi(
      method: APIType.GET,
      url: APIUrls.getAllPermissions,

    );
    return response;
  }*/


}