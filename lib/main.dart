import 'package:flutter/material.dart';
import 'package:prefs/side.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
runApp(MaterialApp(home: first(),));
}
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  int? cnt;
  bool status= false;


  @override
  void initState() {
    super.initState();
    prefs();
  }

  prefs()
  async {

      model.pre = await SharedPreferences.getInstance();

      cnt =model.pre!.getInt("abc") ?? 0;

      status = true;
      setState((){});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Plus")),
      body: status ? Column(
        children: [
          Text("$cnt",style: TextStyle(fontSize: 30),),
          ElevatedButton(onPressed: () async {
            cnt = cnt! + 1;
            await model.pre!.setInt('abc', cnt!);
            setState((){});
          }, child: Text("add"))
        ],
      ) : Center(child:  CircularProgressIndicator(),)
    );
  }
}
