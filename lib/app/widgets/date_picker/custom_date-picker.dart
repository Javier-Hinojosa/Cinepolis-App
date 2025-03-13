import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';

// ignore: must_be_immutable
class CustomDatePicker extends StatelessWidget{

  var datePickedValue = DateTime.now();
  final date = TextEditingController(text: 'Ingresa una fecha');
  final Function(String date) dateValue;

  CustomDatePicker(this.dateValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextButton(
              child: Icon(
                Icons.calendar_today_outlined,
                color: Theme.of(context).hoverColor,
              ),
              onPressed: () async{
                datePickedValue= (await DatePicker.showSimpleDatePicker(
                  context,
                  titleText: 'Ingresa una fecha',
                  initialDate: datePickedValue,
                  firstDate: DateTime.now().add(Duration(days: -30)),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                  dateFormat: "yyyy-MM-dd",
                  locale: DatePicker.localeFromString("es"),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemTextStyle: Theme.of(context).textTheme.bodyMedium,
                  reverse: true,
                  cancelText: 'Cancelar',
                  confirmText: 'Aceptar',
                  textColor: Theme.of(context).highlightColor,
                ))!;

                if (datePickedValue.toIso8601String().isEmpty){
                  date.text = 'Ingresa una fecha';
                dateValue("");
                } else{
                  date.text = datePickedValue.toString().split(' ')[0].trim();
                dateValue(date.text);
                }
              }),
        ),
        Flexible(
          child: TextField(
            controller: date,
            readOnly: true,
            textAlign: TextAlign.center,
            enabled: false,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}