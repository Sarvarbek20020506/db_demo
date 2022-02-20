import 'package:db_demo/model/db_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDB {
  var box = Hive.box('pdp_online');

  void storeUser(User user) async {
    box.put('user', user.toJson());
  }

  User loadUser() {
    var user = User.fromJson(box.get('user'));
    return user;
  }

  void removeUser() async {
    box.delete('account');
  }


  void storeAccount(Account account) async {
    box.put('account', account.toJson());
  }

  User loadAccount(Account account) {
    var account = User.fromJson(box.get('account'));
    return account;
  }

  void removeAccount() async {
    box.delete('account');
  }
}
