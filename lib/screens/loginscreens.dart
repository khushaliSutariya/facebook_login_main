import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {

  facebookLogin() async{
    try{
      final result = await FacebookAuth.i.login(permissions: ['public_profile','email']);
      if(result.status == LoginStatus.success){
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
        print(userData['name']);
      }
    }catch(e){
      print("error==$e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FaceBook")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            facebookLogin();
          }, child: const Text("Facebook login"))
        ],
      ),
    );
  }
}
