import 'package:db_demo/model/db_model.dart';
import 'package:db_demo/pages/home_page.dart';
import 'package:db_demo/pages/signup_page.dart';
import 'package:db_demo/services/data_servise.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
class LogInPage extends StatefulWidget {
  static final String id="login_page";
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController usernameController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  void doLogIn(){
    String username=usernameController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    var user=new User(username: username, password: password);
    HiveDB().storeUser(user);
    var user2=HiveDB().loadUser();
    print(user2.username);
    print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        color: Colors.indigo.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //#Photo
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage("assets/images/profile.png"),fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10,),
            //#welcome
            Text("Welcome Back!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
            SizedBox(height: 5,),
            Text("Sign in to continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white),),
            SizedBox(height: 60,),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "User Name",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                prefixIcon: Icon(Icons.person,color: Colors.grey,),
              ),
            ),
            SizedBox(height: 20,),
            TextField(

              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                prefixIcon: Icon(Icons.vpn_key,color: Colors.grey,),
              ),
            ),
            SizedBox(height: 20,),
            Text("Forgot Password?",style: TextStyle(color: Colors.grey,fontSize: 15),),
            SizedBox(height: 40,),
            //#LogIn button
            GestureDetector(
              onTap: (){
                doLogIn();
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    colors: [
                      Colors.blueAccent.shade700,
                      Colors.blueAccent.shade400,
                      Colors.blueAccent.shade200,
                      Colors.blueAccent.shade100,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child:Center(
                  child: Icon(Icons.keyboard_arrow_right,size: 40,),
                ),
              ),
            ),
            SizedBox(height: 60,),
            //#signUp
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't havo an account?",style: TextStyle(color: Colors.grey,fontSize: 18),),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, SignUpPage.id);
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
