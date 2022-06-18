

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/cupertino.dart';
import 'package:pk_shop/models/user.dart';

class UserProvider extends ChangeNotifier{

  User? user;
  List<User> _listUser =[];

  List<User> get getListUser{
    return _listUser;
  }

  void addUserData({
  required u.User currentUser,
    String? userName,
    String? userImage,
    String? userEmail,
})async{
  await FirebaseFirestore.instance.collection("User").doc(currentUser.uid)
      .set({
    'userName': userName,
    'userImage' : userImage,
    'userEmail' : userEmail,
    'userId' : currentUser.uid
  });
}

  fetchUserData() async{
    List<User> newListUser = [];
    List<String> list = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("User").get();
    value.docs.forEach((element) {
      user = User(
        userId: element.get('userId') ?? "",
        userName: element.get('userName') ?? "",
        userEmail: element.get('userEmail')?? "",
        userImage: element.get('userImage') ?? "",
        userPhone: element.data().toString().contains('userPhone')?  element.get('userPhone') : null,
        userAddress: element.data().toString().contains('userAddress')? element.get('userAddress'): null,
          );
      newListUser.add(user!);
    });
    _listUser = newListUser;
    notifyListeners();
  }

  updateUser(User user){
    FirebaseFirestore.instance.collection("User")
        .doc(u.FirebaseAuth.instance.currentUser!.uid)
        .update(user.toJson());
  }
}