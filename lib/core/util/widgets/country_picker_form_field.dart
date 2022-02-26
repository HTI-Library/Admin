import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryPickerFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  double radius;

  CountryPickerFormField({
    required this.hint,
    required this.controller,
    this.radius = 40.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value!.isEmpty) {
          return "$hint can't be empty";
        }
        return null;
      },
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15.0,
          ),
          child: CountryCodePicker(
            padding: EdgeInsets.zero,
            onChanged: print,
            initialSelection: 'AE',
            favorite: const ['+971', 'AE'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            showDropDownButton: false,
            textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
