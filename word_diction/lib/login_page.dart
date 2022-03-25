import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightVar = MediaQuery.of(context).size.height;
    double widthVar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          child: Padding(
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
                    onPressed: () {},
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
      )),
    );
  }
}
