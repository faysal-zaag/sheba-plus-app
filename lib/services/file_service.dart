import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_plus/data/api/api_urls.dart';

class FileService {
  final Dio _dio;
  FileService(this._dio);

  Future<Response> uploadImage({required XFile file}) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "images": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: DioMediaType('image', fileName.split('.').last),
      ),
    });

    return await _dio
        .post(ApiUrls.imageUploadApiUrl, data: formData);
  }
}
