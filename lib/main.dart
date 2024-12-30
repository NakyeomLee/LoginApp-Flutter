import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 실행창에 뜨는 디버그 표시 지우기
      // 첫 번째 페이지는 로그인 페이지(앱은 왠만하면 첫 페이지가 로그인 페이지)
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LoginPage")),
      body: Align(
          // -1, -1 -> 1, 1 (묵시적 형변환됨)
          alignment: Alignment(0, 0),
          child: ElevatedButton(
              onPressed: (){
                // 로그인 버튼을 누르면 홈 화면으로 이동하도록
                // 로그인 버튼 눌러서 홈 화면으로 가면 홈 화면의 title(HomePage) 옆에 뒤로가기 화살표가 생김
                Navigator.pushNamed(context, "/home");
                // 직접 new하면서 넘기는 방법
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("로그인")
          ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: Align(
        // -1, -1 -> 1, 1 (묵시적 형변환됨)
        alignment: Alignment(0, 0),
        child: ElevatedButton(
            onPressed: (){
              // 돌아가기를 누르면 로그인 화면으로 돌아감 (로그인 화면의 타이틀 옆에 화살표는 안 생김)
              Navigator.pop(context);
            },
            child: Text("돌아가기")
        ),
      ),
    );
  }
}