import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white60),
            overlayColor: MaterialStateProperty.all<Color>(Colors.white60),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.white60))
          )
        ),
        primaryColor: Color(0xFF161330),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'FinanCerto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _essencial = 0;
  double _curtoPrazo = 0; 
  double _longoPrazo = 0; 
  double _livre = 0;
  String semOrcamento = "0.0";

  TextEditingController _textEditingController = TextEditingController();

  void calculaOrcamento(double value){
    setState(() {
      if(value > 0){
      _essencial = (value*60)/100;
      _curtoPrazo = (value*10)/100;
      _longoPrazo = (value*10)/100;
      _livre = (value*20)/100;
      }
      else{
        _essencial = 0;
      _curtoPrazo = 0;
      _longoPrazo = 0;
      _livre = 0;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      backgroundColor: Color(0xFF161330),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Flexible(
                          flex: 1,     
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10 ,top: 8),
                            child: Text("Custos Essenciais",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            
                            ),
                          ),
                        ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.redAccent,
                              ),
                  height: 150,
                  width: 400,
                  child: Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [                       
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_essencial == 0 ?"$semOrcamento":"R\$ $_essencial",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32 ,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              
              children: [
                Flexible(
                              flex: 1,     
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10 ,top: 8),
                                child: Text("Curto Prazo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                
                                ),
                              ),
                            ),
                SizedBox(width: 110,),
                Flexible(
                              flex: 1,     
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10 ,top: 8),
                                child: Text("Longo Prazo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                
                                ),
                              ),
                            ),
              ],
            ),
            
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blueAccent,
                                        
                                    ),
                        height: 150 ,
                        child:  Center(
                          child:Text(_curtoPrazo == 0 ?"$semOrcamento":"R\$ $_curtoPrazo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),),),
                        //color: Colors.white60,
                        ),
                      ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150 ,
                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blueAccent,

                                    ),
                        child:  Center(
                          child:Text(_longoPrazo == 0 ?"$semOrcamento":"R\$ $_longoPrazo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),),),
                        ),
                        
                      ),
                  ),
                ],

              ),
            ),
             Flexible(
                              flex: 1,     
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10 ,top: 8),
                                child: Text("Gastos Livres",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                
                                ),
                              ),
                            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.lightGreen,
                                    ),
                       child:  Center(
                          child:Text(_livre == 0 ?"$semOrcamento":"R\$ $_livre",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),),),
                       
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white12,
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: "Digite aqui seu orçamento",
                            hintStyle: TextStyle(color: Colors.white54),
                            fillColor: Colors.white60,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white70)),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))
                          ),
                          style: TextStyle(color: Colors.white60),
                          cursorColor: Colors.white60,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark ,
                          onEditingComplete: (){
                            if(_textEditingController.text.isNotEmpty){
                              calculaOrcamento(double.parse(_textEditingController.text));                          
                              _textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    )
                  ),
                  
                ],
              ),
            )
           
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
