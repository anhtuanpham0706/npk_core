


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npk_core/service/npk_model.dart';
import 'package:npk_core/service/result_model.dart';


class ModuleNpkEvent {
  const ModuleNpkEvent();

}
class ModuleNpkState {
  const ModuleNpkState();
}


class LoadListNpkEvent extends ModuleNpkEvent {
  final String url;
  const LoadListNpkEvent(this.url);

}
class SendInfoNpkEvent extends ModuleNpkEvent {
  final String url;
  final String weight;
  final String n_rate;
  final String p_rate;
  final String k_rate;
  final List<int> list;
  const SendInfoNpkEvent(this.url,this.weight,this.n_rate,this.p_rate,this.k_rate,this.list);
}
class SendInfoNpkState extends ModuleNpkState {
  final NpkResult result;
  const SendInfoNpkState(this.result);
}

class LoadListNpkState extends ModuleNpkState {
  final List<NpkModel> list;
  const LoadListNpkState(this.list);
}

class NpkModuleBloc extends Bloc<ModuleNpkEvent, ModuleNpkState> {
  NpkModuleBloc({ModuleNpkState init = const ModuleNpkState()}) : super(init) {
    on<LoadListNpkEvent> ((event, emit) async {
      var list = await getlistnpk(event.url);
      emit(LoadListNpkState(list));
    });
    on<SendInfoNpkEvent> ((event, emit) async {
      var list = await getresult_npk(event.url,event.weight, event.n_rate, event.p_rate, event.k_rate, event.list);
    emit(SendInfoNpkState(list));
    });
  }



}


Future getresult_npk(String url,String weight, String n_rate, String p_rate, String k_rate, List<int> list) async {

  try {
    NpkResult result;
    bool logout = true;
    http.Response response =
    await http.get(Uri.parse('${url}/api/v1/npk_manures/npk_calculator?weight=${weight}&n_rate=${n_rate}&p_rate=${p_rate}&k_rate=${k_rate}&npk_manures[]=${list[0]}&npk_manures[]=${list[1]}&npk_manures[]=${list[2]}')
    );
    if((json.decode(response.body))['success']){
      result = NpkResult.fromJson((json.decode(response.body))['data']);

      return result;
    } else {
      return logout;
    }
  } catch (e) {

    rethrow;
  }
}

Future getlistnpk(String url) async {

  try {
    List<NpkModel> list = [];
    bool logout = true;
    http.Response response =
    await http.get(Uri.parse('${url}/api/v1/npk_manures'),
    );
    if((json.decode(response.body))['success']){
      List list_npk = (json.decode(response.body))['data'];
      for (Map m in list_npk) {
        list.add(NpkModel().fromJson(m));
      }
      return list;
    } else {
      return logout;
    }
  } catch (e) {

    rethrow;
  }
}

