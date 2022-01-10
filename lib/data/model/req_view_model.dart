import 'package:rover/core/config/api_config.dart';

class ReqView {
  ReqView({this.sol, this.camera, this.page,this.apiKey = Api.apiKey,this.earthDate});

    int? sol;
    String? camera;
    int? page;
    String apiKey;
    String? earthDate;


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['sol'] = sol;
    _data['camera'] = camera;
    _data['page'] = page;
    _data['api_key'] = apiKey;
    _data['earth_date'] = earthDate;
    return _data;
  }
}
