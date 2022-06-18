

import 'package:flutter/material.dart';
import 'package:pk_shop/models/review_cart.dart';
import 'package:pk_shop/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/function/function.dart';
import '../../models/user.dart';
import 'order_page.dart';

class AddInfoUserPage extends StatefulWidget {

  User? currentUser;
  List<ReviewCart> listReviewCart;

  AddInfoUserPage({Key? key, this.currentUser, required this.listReviewCart}) : super(key: key);

  @override
  State<AddInfoUserPage> createState() => _AddInfoUserPageState();
}

class _AddInfoUserPageState extends State<AddInfoUserPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _tinhCtrl = TextEditingController();
  final TextEditingController _huyenCtrl = TextEditingController();
  final TextEditingController _xaCtrl = TextEditingController();
  final TextEditingController _diaChichiTietCtrl = TextEditingController();
  User? currentUser;
  List<dynamic> listAddress = [];
  String? phone;
  String address = "";

  UserProvider? userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = widget.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bổ sung thông tin đơn hàng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) => phone = value,
                  controller: _phoneCtrl,
                  validator: (value) => ValidateString(value),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Số điện thoại',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  validator: (value) => ValidateString(value),
                  controller: _diaChichiTietCtrl,
                  decoration: InputDecoration(
                      labelText: 'Tên đường, số nhà',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  validator: (value) => ValidateString(value),
                  controller: _xaCtrl,
                  decoration: InputDecoration(
                      labelText: 'Xã/Thị trấn',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  validator: (value) => ValidateString(value),
                  controller: _huyenCtrl,
                  decoration: InputDecoration(
                      labelText: 'Huyện/Phường',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextFormField(
                  validator: (value) => ValidateString(value),
                  controller: _tinhCtrl,
                  decoration: InputDecoration(
                      labelText: 'Tỉnh thành',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){
                      _save(context);
                    },
                        child: Text('Save'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context) {

    if(formState.currentState!.validate()) {
      formState.currentState!.save();
      address = _diaChichiTietCtrl.text + ", " +
          _xaCtrl.text + ", " +
          _huyenCtrl.text + ", " +
          _tinhCtrl.text;
      listAddress.add(address);
      User user = User(
        userName: currentUser?.userName,
        userImage: currentUser?.userImage,
        userEmail: currentUser?.userEmail,
        userAddress: listAddress,
        userId: currentUser?.userId,
        userPhone: phone
      );
      userProvider?.updateUser(user);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => OrderPage(listReviewCart: widget.listReviewCart, currentUser: currentUser!),)
      );
    }
  }



}
