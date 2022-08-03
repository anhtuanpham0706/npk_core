








import 'package:npk_core/service/util.dart';

class NpkModels {
  final List<NpkModel>  list = [];
  NpkModels fromJson(json){
    if (json.isNotEmptey){
      json.forEach((ele) => list.add(NpkModel().fromJson(ele)));
    }
    return this;
  }
}

class NpkModel {
  int id, status, amount;
  String kind, code, created_at,updated_at , title, image;
  bool choose, lock;
  NpkModel({
    this.id = -1,
    this.status = -1,
    this.amount = -1,
    this.kind = '',
    this.code = '',
    this.created_at = '',
    this.updated_at = '',
    this.title = '',
    this.choose = false,
    this.lock = false,
    this.image = ''
});
  NpkModel fromJson(Map<dynamic, dynamic> json) {
    id = Util_Npk.getValueFromJson(json, 'id', -1);
    title = Util_Npk.getValueFromJson(json, 'title', '');
    status = Util_Npk.getValueFromJson(json, 'status', -1);
    created_at = Util_Npk.getValueFromJson(json, 'created_at', '');
    updated_at = Util_Npk.getValueFromJson(json, 'updated_at', '');
    kind = Util_Npk.getValueFromJson(json, 'kind', '');
    code = Util_Npk.getValueFromJson(json, 'code', '');
    amount = Util_Npk.getValueFromJson(json, 'amount', -1);
    image = Util_Npk.getValueFromJson(json, 'image', '');
    return this;
  }


}