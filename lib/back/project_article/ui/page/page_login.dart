import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/common/event/login_event.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:flutter_apistudy/back/project_article/manager/app_manager.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_register.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _pwdNode = new FocusNode();
  String _username, _password;
  bool _isObscure = true;
  Color _pwdIconColor;

  @override
  void dispose() {
    _pwdNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登陆"),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: [
                _buildUserName(),
                _buildPwd(),
                _buildLogin(),
                _buildRegister()
              ],
            )));
  }

  Widget _buildUserName() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: '用户名'),
      initialValue: _username,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        // 点击下一步
        FocusScope.of(context).requestFocus(_pwdNode);
      },
      validator: (String value) {
        if (value.trim().isEmpty) {
          return '请输入用户名';
        }
        _username = value;
      },
    );
  }

  Widget _buildPwd() {
    return TextFormField(
      focusNode: _pwdNode,

      ///是否隐藏
      obscureText: _isObscure,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return '请输入密码';
        }
        _password = value;
      },
      textInputAction: TextInputAction.done,
//      onEditingComplete: _doLogin,
      decoration: InputDecoration(
          labelText: '密码',

          ///输入框尾部图标
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _pwdIconColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;

                  ///密码隐藏 图标颜色控制
                  _pwdIconColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  Widget _buildLogin() {
    return Container(
      height: 45.0,
      margin: EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
      child: RaisedButton(
        child: Text(
          '登录',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: _doLogin,
      ),
    );
  }

  void _doLogin() async {
    _pwdNode.unfocus();

    ///输入的内容通过验证
    if (_formKey.currentState.validate()) {
      //TODO 执行登录方法
      debugPrint("longin---------$_username,$_password");

      var result = await Api.login(_username, _password);
      debugPrint("longin---------$result");
      if (result['errorCode'] == -1) {
        Toast.show(result['errorMsg'], context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        AppManager.eventBus.fire(LoginEvent(_username));
        Navigator.pop(context);
      }
    }
  }

  Widget _buildRegister() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        ///孩子居中对齐
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('没有账号？'),
          GestureDetector(
            child: Text(
              '点击注册',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () async {
              ///进入注册
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return RegisterPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
