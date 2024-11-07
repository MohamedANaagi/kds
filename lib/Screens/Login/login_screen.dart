import 'package:cashier_app/Colors/colors.dart';
import 'package:cashier_app/Screens/main_screen.dart';
import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

class ActivationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text(
                    'POS HIGH\nبوس هاي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'غير مفعلKDS ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // تفعيل الكاشير
            Text(
              ' KDS تفعيل ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // حقل إدخال الكود
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'رقم الكاشير',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '***********',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MainScreen()),
                  );

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:AppColor.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'تفعيل',
                  style: TextStyle(fontSize: 25,
                  color: AppColor.TextColor
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // زر خروج
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColor.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'خروج',
                  style: TextStyle(fontSize: 25,
                      color: AppColor.TextColor
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

