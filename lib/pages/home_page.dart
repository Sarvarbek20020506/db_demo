import 'package:db_demo/pages/login_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  static final  String id="home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.pushReplacementNamed(context, LogInPage.id);
        },
        child: Text("Come back Log In",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
