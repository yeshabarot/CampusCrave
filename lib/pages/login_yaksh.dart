import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),

          //column
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //Section 1
            const Image(
                image: AssetImage("images/y_login.png"),
                width: 300,
                height: 270),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome Back",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("No more Q's, Only W's",
                    style: TextStyle(fontSize: 20))),
            const SizedBox(
              height: 30,
            ),
            //section 2
            loginform(),

            //section 3
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("OR"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Image(
                      image: AssetImage("images/y_google.png"),
                      width: 30.0,
                      height: 30,
                    ),
                    onPressed: () {},
                    label: const Text(
                      "Sign-in With Google",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Dont have Account? Sign-in",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }

// class of the form created above
  Form loginform() {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: null,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40), // function to chnage padding
                    backgroundColor: const Color.fromARGB(226, 0, 0, 0),
                    foregroundColor: Colors.white, // textcolor
                    shape: LinearBorder.bottom() //border color and style
                    ),
                child: const Text("LOGIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
