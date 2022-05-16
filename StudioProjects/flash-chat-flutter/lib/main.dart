import 'package:flash_chat/provider/google_sign_in.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black54),
            ),
          ),
          initialRoute: WelcomeScreen.id,
          routes: {
            WelcomeScreen.id: (context) => WelcomeScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            ChatScreen.id: (context) => ChatScreen(),
          },
        ),
        // designSize: const Size(360, 640),
      );
}
