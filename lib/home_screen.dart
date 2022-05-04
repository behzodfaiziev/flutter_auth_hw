import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              textScaleFactor: 2,
            ),   const SizedBox(height: 50,),
            InkWell(
              onTap: () => signOut(context),
              child: Container(
                  height: 40,
                  width: size.width*0.85,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

signOut(BuildContext context) {
  Navigator.of(context).pushNamed('/auth');
}
