import 'dart:math';

import "package:flutter/material.dart";
import 'package:decimal/decimal.dart';
import 'dart:ui' as ui;

void main() => runApp(new MyAppIMC());


class MyAppIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMC",
      home: MyIMC(),


    );
  }
}

class MyIMC extends StatefulWidget {
  @override
  _MyIMCState createState() => _MyIMCState();
}

class _MyIMCState extends State<MyIMC> {

  final massa = TextEditingController();
  final altura = TextEditingController();
  final my_key = GlobalKey<FormState>();
  final decimal = Decimal;

  String showimc = "";
  String massasugerida = "";


  //class para calcular peso

  void imclmulher(){
    int massaideal = 21;
    int decimal = 2;
    int fad = pow(10, decimal);

    if(my_key.currentState.validate()){
      double m = double.parse(massa.text);
      double h = double.parse(altura.text);

      double imc = m/(pow((h/100),2));


      double d = imc;
      d = (d*fad).round()/fad;

      double sugerido = (massaideal*m)/d;
      sugerido = (sugerido*fad).round()/fad;

      setState(() {
        showimc = "$d";

      });
      setState(() {
        massasugerida = "$sugerido";
      });


    }

  }


  void imchomem(){
    int massaideal = 24;
    int decimal = 2;
    int fad = pow(10, decimal);

    if(my_key.currentState.validate()){
      double m = double.parse(massa.text);
      double h = double.parse(altura.text);

      double imc = m/(pow((h/100),2));


      double d = imc;
      d = (d*fad).round()/fad;

      double sugerido = (massaideal*m)/d;
      sugerido = (sugerido*fad).round()/fad;

      setState(() {
        showimc = "$d";

      });
      setState(() {
        massasugerida = "$sugerido";
      });


    }

  }


  @override
  Widget build(BuildContext context) {

    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("IMC"),
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null ),
      ),
      body: Form(
          key: my_key,
          child: Column(
            children: <Widget>[
              Container(
                width: 500,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(0)
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,

                      child: new Image(
                        width: 200,
                        height: 80,
                        image: new AssetImage('assets/images/balanca.png'),
                        color: Colors.white,

                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5),
                      ]),
                      child: TextFormField(
                        controller: massa,
                        validator: (value){
                          if(value.isEmpty) return "Coloque sua massa (kg)";
                        },
                        decoration: InputDecoration(
                          hintText: "Massa (kg)",
                          icon: Icon(Icons.account_balance_wallet, color: Colors.purple,),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Divider( height: 30,),
                    Container(
                      width: 200,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5),
                          ]),
                      child: TextFormField(
                        controller: altura,
                        validator: (value){
                          if(value.isEmpty) return "Coloque sua altura (cm)";
                        },
                        decoration: InputDecoration(
                          hintText: "Altura (cm)",
                          icon: Icon(Icons.present_to_all, color: Colors.purple,),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Divider(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: imchomem,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),),
                          color: Colors.blue,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[Icon(Icons.person, color: Colors.white,), Text("MAN", style: TextStyle(color: Colors.white),)],
                          ),

                        ),
                        VerticalDivider(),
                        FlatButton(
                          onPressed: imclmulher,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),),
                          color: Colors.pinkAccent,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[Icon(Icons.person, color: Colors.white,), Text("WOMAN", style:  TextStyle(color: Colors.white),),],
                          ),

                        ),
                      ],
                    ),
                    Divider(height: 20,),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 1),
                          ]


                      ),
                      child: Center(
                        child: Text(
                          "IMC: "+ showimc,
                          style: TextStyle(
                            fontSize: 20,

                          ),
                        ),
                      ),
                    ),
                    Divider(height: 15,),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1),
                          ]


                      ),
                      child: Center(
                        child: Text(
                          "Peso Ideal: "+ massasugerida,
                          style: TextStyle(
                            fontSize: 20,

                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              )
            ],
          ) ),


    );
  }
}


