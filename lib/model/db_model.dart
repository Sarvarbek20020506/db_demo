class User{
  String username;
  String password;

  User({required this.username,required this.password});
  User.fromJson(Map<String,dynamic>json)
      :username=json["username"],
        password=json['password'];
  Map<String,dynamic>toJson()=>{
    'username':username,
    'password':password,
  };
}
class Account{
  String username;
  String password;
  String mail;
  String phoneNum;

  Account({required this.username,required this.password,required this.mail,required this.phoneNum});
  Account.fromJson(Map<String,dynamic>json)
      :username=json["username"],
        password=json['password'],
        phoneNum=json['phoneNum'],
        mail=json['mail'];
  Map<String,dynamic>toJson()=>{
    'username':username,
    'password':password,
    'mail':mail,
    'phoneNum':phoneNum,
  };
}