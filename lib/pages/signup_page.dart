import 'package:db_demo/model/db_model.dart';
import 'package:db_demo/pages/home_page.dart';
import 'package:db_demo/pages/login_page.dart';
import 'package:db_demo/services/data_servise.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  static final String id="signup_page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
final TextEditingController usernameController= TextEditingController();
final TextEditingController passwordController= TextEditingController();
final TextEditingController mailController=TextEditingController();
final TextEditingController phoneNumController=TextEditingController();
void doSignUp() {
  String username = usernameController.text.toString().trim();
  String password = passwordController.text.toString().trim();
  String mail = mailController.text.toString().trim();
  String phoneNum = phoneNumController.text.toString().trim();
  var account = new Account(
      username: username, password: password, phoneNum: phoneNum, mail: mail);
  HiveDB().storeAccount(account);
  var account2 = HiveDB().loadAccount(account);
  print(account2.username);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        color: Colors.indigo.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
            SizedBox(height: 5,),
            Text("Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
            SizedBox(height: 60,),
            TextField(
              controller: usernameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "User Name",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                prefixIcon: Icon(Icons.person,color: Colors.grey,),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "E-Mail",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                prefixIcon: Icon(Icons.mail,color: Colors.grey,),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: phoneNumController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Phone Num",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                prefixIcon: Icon(Icons.local_phone_outlined,color: Colors.grey,),
              ),
            ),
            SizedBox(height:30,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                prefixIcon: Icon(Icons.vpn_key,color: Colors.grey,),
              ),
            ),
            SizedBox(height: 30,),
            Text("Forgot Password?",style: TextStyle(color: Colors.grey,fontSize: 15),),
            SizedBox(height: 40,),
            //#LogIn button
            GestureDetector(
              onTap: (){
                doSignUp;
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Container(
                height: 70,
                width: 70,
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
            SizedBox(height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ",style: TextStyle(color: Colors.grey,fontSize: 18),),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, LogInPage.id );
                    },
                    child: Text("Log In",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
