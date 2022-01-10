import 'package:dio/dio.dart';
import 'package:rover/core/config/api_config.dart';
import 'package:rover/core/service/http_service.dart';
import 'package:rover/data/model/req_view_model.dart';
import 'package:rover/data/model/res_view_model.dart';

class ViewService {

    final HttpService httpService; 

    ViewService(this.httpService);

 

  Future<List<View>> getView({required String ship,required ReqView parameters}) async {
    try {
     
      Response _response =
          await httpService.httpGet(url: '/${ship}/photos', data: parameters.toJson());

        List<View> list = _response.data['photos'].map<View>((e) => View.fromJson(e)).toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
