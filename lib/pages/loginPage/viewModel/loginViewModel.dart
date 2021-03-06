import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';



class LoginViewModel{

  TextEditingController _emailController ;
  TextEditingController _passController ;

  bool _emailFocus;
  bool _passFocus;
  bool _onPassChange;



  void initData(){
    this._emailFocus=false;
    this._passFocus=false;
    this._onPassChange=false;
    this._emailController = TextEditingController();
    this._passController = TextEditingController();

  }

  void disposeControllers(){
    this._passController.dispose();
    this._emailController.dispose();
  }


  bool get emailFocus =>  this._emailFocus;
  set emailFocus(bool value)=>this._emailFocus=value;

  bool get passFocus =>  this._passFocus;
  set passFocus(bool value)=>this._passFocus=value;

  bool get onPassChange =>  this._onPassChange;

  TextEditingController get emailController=>this._emailController;


  TextEditingController get passController=>this._passController;


  void modifyOnPassChange(){
    this._passController.text.isEmpty?
    this._onPassChange=false:this._onPassChange=true;
  }


  //altera os estados de cada campo de loguin, se campo email ta no estado de focus
  //campo senha volta pra não Focus
  void switchTextField(String btn){

    switch(btn){
      case 'email':
        this._passFocus=false;
        this._emailFocus=true;
        break;
      case 'pass':
        this._emailFocus=false;
        this._passFocus=true;
        break;
      default:
        break;
    }

  }

  //muda a label do email conforme o estado em que o campo se encontra
  String emailLabelText(){

    return this._emailFocus==false?
        this._emailController.text.isEmpty? 'Insira o seu e-mail aqui': 'E-mail'
        : 'E-mail';
  }

  //muda o estilo aplicado a label do email conforme o estado em que o campo se encontra
  Color emailLabelStyle(){
    return this._emailFocus==false?
            Colors.black54: Color.fromRGBO(255,136,34,1);
  }

  String passLabelText(){
    return this._passFocus==false?
            this._passController.text.isEmpty? 'Insira a sua senha aqui': 'Senha'
                : 'Senha';
  }

  Color passLabelStyle(){
    return this._passFocus==false?
          Colors.black54: Color.fromRGBO(255,136,34,1);
  }

//muda a cor do icone do campo senha quando se digita um valor
  Color iconPassField(){
    return this._onPassChange==true?
            Color.fromRGBO(255,136,34,1):Color.fromRGBO(255,136,34,0.5);
  }

  //condição para que o botão de loguin ative suas funcionalidades
  bool buttonActivate(){
    return this._emailController.text.isNotEmpty && this._passController.text.isNotEmpty;
  }

  Color singInColor(){
    return this._emailController.text.isNotEmpty && this._passController.text.isNotEmpty?
    Color.fromRGBO(255,136,34,1):Color.fromRGBO(255,136,34,0.5);
  }


}