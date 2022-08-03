
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npk_core/UI/result_npk_page.dart';
import 'package:npk_core/bloc/npk_bloc.dart';
import 'package:npk_core/service/npk_model.dart';
import 'package:npk_core/service/result_model.dart';
import 'package:npk_core/service/util.dart';

class NpkModulePage extends StatefulWidget {
  final String url;
  const NpkModulePage({Key? key, this.url = ''}) : super(key: key);

  @override
  State<NpkModulePage> createState() => _NpkModulePageState();
}

class _NpkModulePageState extends State<NpkModulePage> {
  final NpkModuleBloc _npk_bloc = NpkModuleBloc();
   List<NpkModel> list = [];
  List<int> list_npk = [];
  late NpkResult result;

  TextEditingController weight_crt = TextEditingController();
  TextEditingController N_crt = TextEditingController();
  TextEditingController P_crt = TextEditingController();
  TextEditingController K_crt = TextEditingController();


   void initState() {
     _npk_bloc.add(LoadListNpkEvent(widget.url));
     super.initState();
     _npk_bloc.stream.listen((state) {
       if(state is LoadListNpkState){
         list.addAll(state.list);
       } else if(state is SendInfoNpkState){
         result = state.result;
           Util_Npk.goToNextPage(context, NpkResultPage(result), null);
       }
     });
   }

  dispose() {
    _npk_bloc.close();
    super.dispose();
  }

   void _lear_result(){
     result;
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Phối trộn phân bón NPK',style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text("Khối lượng phân bón cần trộn (KG)",style: TextStyle(fontSize: 17),),
                  ),
                  Spacer()
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  keyboardType: TextInputType.number,
                  controller: weight_crt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 30, 0),

                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text("Tỉ lệ phân NPK mong muốn",style: TextStyle(fontSize: 16),),
                  ),
                  Spacer()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("N"),
                      Container(
                        width: 120,
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          keyboardType: TextInputType.number,
                          controller: N_crt,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("P"),
                      Container(
                        width: 120,
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          keyboardType: TextInputType.number,
                          controller: P_crt,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("K"),
                      Container(
                        width: 120,
                        height: 60,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          keyboardType: TextInputType.number,
                          controller: K_crt,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black26,width: 0.5)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text("Chọn phân để trộn",
                          style: TextStyle(fontSize: 15,color: Colors.black),),
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.all(Radius.circular(5)),
                          color: Colors.black26
                        ),
                      ),
                      BlocBuilder(
                        bloc: _npk_bloc,
                          buildWhen: (oldstate, newstate) =>newstate is LoadListNpkState,
                          builder: (context, state){
                          final List<Widget> list_option = [];
                          if(list != []){
                            for(int i =0; i < list.length;i++){
                              list_option.add(Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
                                child: GestureDetector(
                                  onTap: (){
                                    _choose_npk(i);
                                    setState(() {
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                                        width: 25,
                                        height: 25,
                                        child: list[i].choose? Icon(Icons.check_box_outlined,color: Colors.green,) : Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text("${list[i].code}-${list[i].title} (${list[i].kind == "nitrogen"? 'N':list[i].kind =="phosphor"? 'P': "K"})",style: TextStyle(color: list[i].lock?Colors.black45:Colors.black),),
                                      ),
                                    ],
                                  ),
                                ),));
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: list_option,);
                          }
                          return SizedBox();

                      }),

                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      int i = 0;
                      for(i = 0; i< list.length;i++){
                        list[i].lock = false;
                        list[i].choose = false;
                      }
                      list_npk.clear();
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 160,
                      height: 45,
                      child: Center(child: Text("Xóa hết",style: TextStyle(fontSize: 15,color: Colors.white),)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.red
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(weight_crt.text.isNotEmpty && N_crt.text.isNotEmpty && P_crt.text.isNotEmpty && K_crt.text.isNotEmpty){
                        int i = 0;
                        for(i =0; i< list.length;i++){
                          if(list[i].choose){
                            list_npk.add(list[i].id);
                          }
                        }
                        if(list_npk.length == 3){
                          _npk_bloc.add(SendInfoNpkEvent(widget.url,weight_crt.text,N_crt.text,P_crt.text,K_crt.text,list_npk));
                        }
                      } else{
                        Util_Npk.showCustomAlertDialog(context, 'Thông báo',title: 'Vui lòng chọn đầy đủ thuộc tính',isActionCancel: false);
                      }
                    },
                    child: Container(
                      width: 160,
                      height: 45,
                      child: Center(child: Text("Xem kết quả",style: TextStyle(fontSize: 15,color: Colors.white),)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.green
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _choose_npk(int index){
     int i = 0;
     if(list[index].lock == false){
       if(list[index].choose){
         list[index].choose = !list[index].choose;
         for(i = 0; i< list.length; i++){
           if(list[i].kind == list[index].kind){
             list[i].lock = false;
           }
         }
       } else {
         list[index].choose = !list[index].choose;
         for(i = 0; i< list.length; i++){
           if(list[i].kind == list[index].kind){
             if(i == index){
               list[i].lock = false;
             } else {
               list[i].lock = true;
             }
           }
         }
       }
     }
  }
}
