import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin","Reamur","Fahrenheit"];
  String selectedDropdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: etInput,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Celcius',
                hintText: 'Enter the temperature in celcius',
              ),
            ),
            SizedBox(height: 8),
            DropdownButton(
              isExpanded: true,
              value : selectedDropdown,
              items: listSatuanSuhu.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value){
                onDropdownChanged(value);
              },
              ),
              SizedBox(height: 10),
              Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
                ),
              Text(
                "$hasilPerhitungan",
                style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 10),
                
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        konversiSuhu();
                      }, 
                      child: Text("Konversi Suhu"),
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10),
                Text("Riwayat Konversi",style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: listHasil.length,
                    itemBuilder: (context,index){
                      return Text(listHasil[index]);
                    },
                  ) ,
                  ),
        ],
        ),
      )      
    );
  }

  void konversiSuhu() {
    return setState(() {
                        if (etInput.text.isNotEmpty){
                          hasilPerhitungan = int.parse(etInput.text)*2;
                          switch (selectedDropdown) {
                            case "Kelvin":
                              hasilPerhitungan = int.parse(etInput.text)+273.15;
                              break;
                            case "Reamur":
                              hasilPerhitungan = int.parse(etInput.text)*4/5;
                              break;
                            case "Fahrenheit":
                              hasilPerhitungan = int.parse(etInput.text) * 9 / 5 + 32;
                              break;                      
                          }
                          listHasil.add("Konversi dari "+
                          etInput.text +
                          " Celcius ke "+
                          selectedDropdown +
                          " Dengan Hasil : "+
                          hasilPerhitungan.toString());
                        }                        
                      });
  }

  void onDropdownChanged(Object? value) {
    return setState(() {
                selectedDropdown = value.toString();
              });
  }
}


