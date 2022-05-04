import 'package:flutter/material.dart';
import 'package:flutter_auth_homework/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool isVisible = false;

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _emailFocus.unfocus();
          _passwordFocus.unfocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onSubmitted: (String val) {
                  _emailFocus.unfocus();
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
              ),
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: !isVisible,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    )),
                onSubmitted: (String val) {
                  _passwordFocus.unfocus();
                },
              ),
              const SizedBox(height: 50,),
              InkWell(
                onTap: () => signIn(_emailController.text.trim().toString(),
                    _passwordController.text.trim().toString(), context),
                child: Container(
                 height: 40,
                  width: size.width*0.85,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 50,),
              const Text(
                'Credentials: test@1.com, 12345',
              )
            ],
          ),
        ),
      ),
    );
  }
}

signIn(String email, String password, BuildContext context) {
  if (email == 'test@1.com') {
    print('sign f');
    if (password == '12345') {
      print('sign');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      print('sign d');
      const snackBar = SnackBar(
        content: Text(
          'Password is incorrect',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } else {
    const snackBar = SnackBar(
      content: Text(
        'Email is incorrect',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
