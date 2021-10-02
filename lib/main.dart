import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pierorolandoblog/bloc/auth/auth_bloc.dart';
import 'package:pierorolandoblog/bloc/modal/modal_bloc.dart';
import 'package:pierorolandoblog/bloc/post/post_bloc.dart';
import 'package:pierorolandoblog/pages/HomePage.dart';
import 'package:pierorolandoblog/pages/LoadingPage.dart';
import 'package:pierorolandoblog/pages/LoginPage.dart';
import 'package:pierorolandoblog/pages/PostEditPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModalBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => PostBloc())
      ],
      child: FutureBuilder(
          future: _initialization,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError)
              return Scaffold(body: Center(child: Text("Algo salió mal")));

            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                darkTheme:ThemeData.dark(),
                home: MyCupeApp()
              );
            }

            return CupertinoActivityIndicator();
          }),
    );
  }
}

class MyCupeApp extends StatelessWidget {
  const MyCupeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModalBloc, ModalState>(
      builder: (context, state) {
        print(state.modalOpen);
        return LoadingOverlay(
          isLoading: state.modalOpen,
          color: Color.fromRGBO(17, 24, 39, 1),
          opacity: 0.97,
          progressIndicator: CircularProgressIndicator(
            strokeWidth: 1,
            color: Color.fromRGBO(35, 95, 245, 1),
          ),
          child: CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(brightness: Brightness.dark
                // primaryColor: Color.fromRGBO(35, 95, 245, 1),
                // scaffoldBackgroundColor: Color.fromRGBO(24, 33, 47, 1),
                // barBackgroundColor: Color.fromRGBO(17, 24, 39, 1),
            ),
            title: 'Material App',
            routes: {
              '/': (context) => LoadingPage(),
              '/home': (context) => HomePage(),
              '/login': (context) => LoginPage(),
            },
            initialRoute: '/',
          ),
        );
      },
    );
  }
}
