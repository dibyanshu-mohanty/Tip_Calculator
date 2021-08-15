import 'package:flutter/material.dart';
import 'package:tip_calculator/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final amountController = TextEditingController();

  final guestController = TextEditingController();

  String dropdownValue = '5%';
  double result=0.0;

  void calculateTip(String guest, String amount, String service){
    int g = int.parse(guest);
    double a = double.parse(amount);
    if (service=="5%"){
      setState(() {
        result= (a/g)*0.05;
      });
    } else if (service=="10%"){
      setState(() {
        result= (a/g)*0.1;
      });
    } else if (service=="15%"){
      setState(() {
        result= (a/g)*0.15;
      });
    } else{
      setState(() {
        result= (a/g)*0.2;
      });
    }
  }

  showDialog(){
    return Alert(
      context: context,
      type: AlertType.success,
      title: "Your Tip / Person is",
      desc: "\u{20B9} " + result.toStringAsFixed(2),
      buttons: [
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: (MediaQuery.of(context).size.height) * 0.9,
        margin: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/51nDJ40IAgL.png",
                height: 200.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Calculate Tips in Seconds",style: TextStyle(fontSize: 22.0),),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: kTextFieldDecoration.copyWith(
                  labelText: "Total Amount",
                  prefixIcon: Icon(Icons.money),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: guestController,
                keyboardType: TextInputType.number,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: "No. Of Guests",
                  prefixIcon: Icon(Icons.people),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Choose Service Type"),
                  DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 12,
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: ['5%', '10%', '15%', '20%']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    calculateTip(guestController.text, amountController.text, dropdownValue);
                    showDialog();
                    amountController.clear();
                    guestController.clear();
                    setState(() {
                      dropdownValue="5%";
                    });
                  },
                  child: Text("CALCULATE"))
            ],
          ),
        ),
      ),
    );
  }
}
