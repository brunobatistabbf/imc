import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Calculo IMC"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _alturaController.text = '';
                  _pesoController.text = '';
                  resultado = "";
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  width: 200,
                  height: 200,
                  child: const Image(
                    image: AssetImage("images/image.png"),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Altura:",
                    prefix: Text("Cm "),
                    labelStyle: TextStyle(color: Colors.blue),
                    suffixIcon: Icon(Icons.face),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Peso:",
                    prefix: Text("Cm "),
                    labelStyle: TextStyle(color: Colors.blue),
                    suffixIcon: Icon(Icons.battery_full),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    child: const Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      double vAltura = double.parse(
                        _alturaController.text.toString(),
                      );
                      double vPeso = double.parse(
                        _pesoController.text.toString(),
                      );

                      double relacao = (vPeso / (vAltura * vAltura));

                      setState(() {
                        if (relacao <= 18.5) {
                          resultado = "Abaixo do Peso";
                        } else if (relacao >= 18.5 && relacao <= 25) {
                          resultado = "Normal";
                        } else if (relacao >= 25 && relacao <= 30) {
                          resultado = "Acima do Peso";
                        } else if (relacao >= 30 && relacao <= 35) {
                          resultado = "Obesidade I";
                        } else if (relacao >= 35 && relacao <= 40) {
                          resultado = "Obesidade II";
                        } else {
                          resultado = "Obesidade III(morbidad) ";
                        }
                      });
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  resultado,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
