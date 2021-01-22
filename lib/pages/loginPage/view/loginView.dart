
import 'package:desafio_flutter_mobile/pages/loginPage/viewModel/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginViewModel logVM;


 @override
  void initState() {
   logVM = LoginViewModel();
   logVM.initData();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    logVM.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double sizeW =MediaQuery.of(this.context).size.width;
    double sizeH = MediaQuery.of(this.context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xffFAFAFA),
        statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: sizeW,
            height: sizeH,

            decoration: BoxDecoration(
              color: Color(0xffFAFAFA)
            ),
            padding: EdgeInsets.only(right:sizeW*0.05, left:sizeW*0.05 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  width: sizeW,
                  height: sizeH*0.8,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom:sizeH*0.09),
                        child: SizedBox(
                          width: sizeW,
                          height: sizeH*0.15,
                          child:SvgPicture.asset('images/appetit_logo.svg'),
                        ),
                      ),
                      SizedBox(
                        width: sizeW,
                        height: sizeH*0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Seja bem-vindo!',
                                textAlign: TextAlign.center,
                                style:GoogleFonts.openSans(
                                  textStyle:TextStyle(
                                      color: Color(0xffE57A1F),
                                      fontWeight: FontWeight.w400,
                                      fontSize: sizeH*0.04
                                  ),
                                )
                            ),
                            Text(
                                'Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar no seu dia.',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style:GoogleFonts.openSans(
                                  textStyle:TextStyle(
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: sizeH*0.023,
                                      height: sizeH*0.0025
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Form(
                        child: Container(
                          width: sizeW*0.9,
                          height: sizeH*0.25,

                          child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                controller: logVM.emailController,

                                onTap: (){
                                  setState(() {
                                    logVM.switchTextField('email');
                                  });

                                },
                                onFieldSubmitted: (value){
                                  setState(() {
                                    logVM.emailFocus=false;
                                  });

                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText:logVM.emailLabelText(),
                                  labelStyle: TextStyle(
                                    color: logVM.emailLabelStyle()
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(255,136,34,1),
                                      )
                                  ),
                                ),
                                cursorColor:Color.fromRGBO(255,136,34,1) ,
                              ),
                              TextFormField(

                                controller: logVM.passController,
                                onTap: (){
                                  setState(() {
                                    logVM.switchTextField('pass');
                                  });
                                },onChanged: (value){
                                  setState(() {
                                    logVM.modifyOnPassChange();
                                  });

                              },
                                onFieldSubmitted: (value){
                                 logVM.passFocus=false;
                              },
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText:logVM.passLabelText(),
                                  labelStyle: TextStyle(
                                      color: logVM.passLabelStyle()
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(255,136,34,1),
                                      )
                                  ),
                                  suffixIcon: SvgPicture.asset('images/CombinedShape45.svg',
                                    fit: BoxFit.scaleDown,
                                    color: logVM.iconPassField(),
                                  ),
                                ),
                                cursorColor:Color.fromRGBO(255,136,34,1) ,
                              ),

                            ],
                          ),
                        ),
                      ),
                      InkResponse(onTap: (){
                        Navigator.of(context).pushReplacementNamed('/historic');

                      },
                        child: Container(
                          width: sizeW*0.9,
                          height: sizeH*0.08,
                          decoration: BoxDecoration(
                            color:logVM.singInColor(),
                            borderRadius: BorderRadius.circular(sizeH*0.05),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ENTRAR',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                        fontSize: sizeH*0.025
                                    )

                                ),

                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
