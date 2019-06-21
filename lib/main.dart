import 'package:flutter/material.dart';

void main() => runApp(new Login());
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }

}
class LoginState extends State<Login> {
  //全局key 用来获取表单控件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  String username;
  String password;

  void login() {
    var loginFrom = loginKey.currentState;
    if (loginFrom.validate()) {
      loginFrom.save();
      print("username" + username + "password" + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "登陆",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("登陆"),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      keyboardType: TextInputType.phone, //限制输入类型
                      decoration: new InputDecoration(labelText: "请输入用户名："),
                      onSaved: (value) {
                        username = value;
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "请输入密码："),
                      obscureText: true, //是否显示字符
                      autovalidate: false,  //是否自动验证
                      validator:(value){
                        return value.length<6 ? "密码长度不够6位":null;
                      } ,
                      onSaved: (v) {
                        password = v;
                      },
                    ),
                    new Container(
                      child:   new SizedBox(
                        width:340 ,
                        height: 42,
                        child: new RaisedButton(onPressed:() {
                          login();
                        },
                          child: new Text("登录"
                            ,style: new TextStyle(
                                fontSize: 18.0
                            ),
                          ),
                        ),
                      ) ,
                      margin: EdgeInsets.only(top: 50), //设置margin 距离顶部
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
