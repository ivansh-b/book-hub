import 'package:book_hub_flutter/auth/googleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 250,
          child: Image.asset('assets/logo.png'),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            height: 40,
            child: SignInButton(Buttons.Google, onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            }),
          ),
        ),
      ],
    );
  }
}


// Container(
//         height: 40,
//         child: SignInButton(Buttons.Google, onPressed: () {
//           final provider =
//               Provider.of<GoogleSignInProvider>(context, listen: false);
//           provider.googleLogin();
//         }),
//       )