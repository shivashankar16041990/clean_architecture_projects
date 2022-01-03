import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jake_wharton/feature/jakes/1_presentation/1_widgets/post_page.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class Biometric extends StatelessWidget {
  var localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: const Center(
                  child: const Padding(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Biometric Required,\nplease click below button to authenticate",
                  softWrap: true,
                  style: const TextStyle(height: 1.5),
                  textScaleFactor: 1.3,
                ),
              )),
              elevation: 8,
              shadowColor: Colors.lightGreenAccent,
              margin: const EdgeInsets.all(10),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Colors.black54, width: 1)),
            ),
          ),



          Padding(
            padding:
                const EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 10),
            child: ElevatedButton(
                onPressed: () async {
                  if (await isbiometricsSupported(context)) {
                    if (await authenticateUser(context)) {
                      ShowMessage(context, "you are authenticated");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => PostsPage()));
                    }
                  } else {
                    ShowMessage(context, "Authentication failed");
                  }
                },
                child: const Text(
                  "Authenticate ",
                  textScaleFactor: 1.5,
                )),
          )
        ]),
      ),
    );
  }

  Future<bool> isbiometricsSupported(BuildContext context) async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    ShowMessage(context, " biometrics Supported is $canCheckBiometrics");
    return canCheckBiometrics;
  }

  Future<bool> authenticateUser(BuildContext context) async {
    try {
      bool isAuthenticated = await localAuth.authenticate(
          localizedReason: "please authenticate using biometric",
          stickyAuth: true,
          biometricOnly: true);

      ShowMessage(context, " isAuthenticated is $isAuthenticated");

      return isAuthenticated;
    } on PlatformException catch (e) {
      {
        // Handle this exception here.
        ShowMessage(
            context, "Biometric is not available on this device ${e.code}");
      }
      return false;
    }
  }

  void ShowMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2), content: Text(msg, softWrap: true)));
  }
}
