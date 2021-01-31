import 'package:flutter/material.dart';

class AlcoholGasoline extends StatefulWidget {
  @override
  _AlcoholGasolineState createState() => _AlcoholGasolineState();
}

class _AlcoholGasolineState extends State<AlcoholGasoline> {

  TextEditingController _controllerAlcohol = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();
  String _resultText = "";

  void _calculate() {
    double alcoholPrice = double.tryParse(_controllerAlcohol.text);
    double gasolinelPrice = double.tryParse(_controllerGasoline.text);

    if (alcoholPrice == null || gasolinelPrice == null) {
      setState(() {
        _resultText = "Invalid number, type number greater than 0 and use dot (.)";
      });
    } else {
      if (alcoholPrice / gasolinelPrice >= 0.7) {
        setState(() {
          _resultText = "Would be better to supply with gasoline";
        });
      } else {
        setState(() {
          _resultText = "Would be better to supply with alcohol";
        });
      }
      //_clearFields();
    }
  }

  void _clearFields() {
    _controllerGasoline.text = "";
    _controllerAlcohol.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcohol or Gasoline"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Know how is the better option to supply your car",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Alcohol price, ex: 1.59",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcohol,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Gasoline price, ex: 3.15",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasoline,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _calculate,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultText,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
