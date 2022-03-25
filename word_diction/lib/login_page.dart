import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightVar = MediaQuery.of(context).size.height;
    double widthVar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 4),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: heightVar / 2,
              child: const Image(
                image: AssetImage('assets/images/front_art-01.png'),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: heightVar / 5,
              width: widthVar / 1.2,
              child: const Image(image: AssetImage('assets/images/name.png')),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, heightVar / 16),
              child: SizedBox(
                height: 52,
                width: widthVar,
                child: ElevatedButton(
                    onPressed: signIn,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        SizedBox(width: 8),
                        Text(
                          "SignIn with Google",
                          style:
                              TextStyle(fontSize: 17, fontFamily: 'Open Sans'),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signIn() async{
  try{
    await _googleSignIn.signIn();
  }catch(e){
    if (kDebugMode) {
      print('Error Signing In $e');
    }
  }
}
