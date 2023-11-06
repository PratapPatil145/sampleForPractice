import '../../base/api_constants.dart';
import '../../base/basehttp.dart';
import '../model/get_q_model.dart';

class GetQRepository {
  Future<List<GetQModel>> GetQDataPasss(Map<String, dynamic> map) async {
    BaseHttp basehttp = BaseHttp();
    print("urlprint ${ApiConstants.GetqpUrl}${map}");
    final response =
        await basehttp.getwithparameters(ApiConstants.GetqpUrl, map);
    print("Responsedata... ${response}");
//   List<GetQModel> list = response == null || response.length == 0 ? []
// : List.from(response.map((x) => GetQModel.fromJson(x)));

// return list;
// var x=await GetQModelFromJson(response);
// print("${x}");
//  print ("datttt..${GetQModelFromJson(response)}");
    return GetQModelFromJson(response);
  }
}
