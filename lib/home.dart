import 'package:flutter/material.dart';
import 'package:task3/networking.dart';

import 'modeluser.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<DataUser>? listUser;

  Future<List<DataUser>?> lisDataUser() async{
    try{
      ModelUser? response = await NetworkProvider().getDataUser();
      setState(() {
        listUser = response?.data;
      });
    }catch(exp){}

    return listUser;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lisDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Udacoding")),
      ),
      body: ListView.builder(
        itemCount: listUser?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(listUser?[index].avatar ?? ''),
                  ),
                  title: Text(listUser?[index].firstName ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: Text(listUser?[index].email ?? ''),
                ),
              ),
            );
          },
      ),
    );
  }
}
