import 'package:flutter/material.dart';
import 'package:npk_core/service/result_model.dart';





class NpkResultPage extends StatelessWidget {
  NpkResult result;
   NpkResultPage(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết quả trộn phân',style: TextStyle(fontSize: 19,color: Colors.white),),
        backgroundColor: const Color(0xFF0E986F),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phân bón",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("Trọng lượng",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(result.manures[0].name,style: TextStyle(color: Colors.black,fontSize: 15),),
                  Text("${result.manures[0].value}Kg",style: TextStyle(color: Colors.black,fontSize: 15),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(result.manures[1].name,style: TextStyle(color: Colors.black,fontSize: 15),),
                  Text("${result.manures[1].value}Kg",style: TextStyle(color: Colors.black,fontSize: 15),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(result.manures[2].name,style: TextStyle(color: Colors.black,fontSize: 15),),
                  Text("${result.manures[2].value}Kg",style: TextStyle(color: Colors.black,fontSize: 15),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phụ gia",style: TextStyle(color: Colors.black,fontSize: 15),),
                  Text("${result.mix}Kg",style: TextStyle(color: Colors.black,fontSize: 15),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TỔNG",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("${result.total}Kg",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 150,
                  height: 40,
                  child: const Center(child: Text("Xong",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xFF0E986F)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
