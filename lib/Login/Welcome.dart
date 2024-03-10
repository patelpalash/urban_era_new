import 'package:flutter/material.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/Login.dart';

import 'package:shoppers_ecommerce_flutter_ui_kit/Login/phone.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Ensures content stays within safe areas (e.g., avoiding notches)
        child: Column(
          children: <Widget>[
            // Text section with desired spacing
            Expanded(
              // Allows the text section to fill some vertical space
              flex: 1, // Twice the space of the image and buttons sections
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center text vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center text horizontally
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Unleash Your Style in the Urban Fashion Frontier.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                ],
              ),
            ),

            // Image container centered and sized appropriately
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Online shopping-cuate.png'),
                ),
              ),
            ),

            // Button section with some spacing from the bottom
            Expanded(
              // Allows buttons to fill remaining space
              flex: 1, // Equal space to the text section
              child: Padding(
                // Add some padding from the bottom
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  // Wrap buttons vertically
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Align buttons to bottom
                  children: <Widget>[
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyPhone()),
                        );
                      },
                      color: Color.fromARGB(255, 7, 7, 7),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
