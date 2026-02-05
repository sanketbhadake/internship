import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 217, 174, 1),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusColor: const Color.fromRGBO(0, 217, 174, 1),
                    ),
                  ),
                ),

                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 217, 174, 1),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusColor: const Color.fromRGBO(0, 217, 174, 1),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromRGBO(0, 217, 174, 1)),
                  borderRadius: BorderRadius.circular(18),
                ),
                focusColor: const Color.fromRGBO(0, 217, 174, 1),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromRGBO(0, 217, 174, 1)),
                  borderRadius: BorderRadius.circular(18),
                ),
                focusColor: const Color.fromRGBO(0, 217, 174, 1),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 217, 174, 1),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusColor: const Color.fromRGBO(0, 217, 174, 1),
                    ),
                  ),
                ),

                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password ',
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 217, 174, 1),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusColor: const Color.fromRGBO(0, 217, 174, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isCheck,
                   activeColor: const Color.fromRGBO(0, 217, 174, 1),
                  onChanged: (value) {
                    setState(() {
                      isCheck = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "By clicking on Sign up you agree to terms & conditions",
                  ),
                ),
              ],

            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                //   Navigator.of(
                //     context,
                //   ).push(MaterialPageRoute(builder: (builder) => LoginScreen()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(0, 217, 174, 1),
                ),
                child: const Center(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              child: Text(
                "Or Log In using social media",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 0.7,
                        offset: Offset(0, 2),
                        color: Colors.grey,
                      ),
                    ],
                    color: const Color.fromRGBO(0, 127, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/facebook.png"),
                      const SizedBox(width: 5),
                      const Text("Facebook", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 0.7,
                        offset: Offset(0, 2),
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google-icon.png"),
                      const SizedBox(width: 5),
                      const Text(
                        "Google",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Guest user",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(0, 217, 174, 1),
                    color: Color.fromRGBO(0, 217, 174, 1),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          decorationColor: Colors.grey,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          decorationColor: Color.fromRGBO(0, 217, 174, 1),
                          color: Color.fromRGBO(0, 217, 174, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],

        ),
      ),
    );
  }
}
