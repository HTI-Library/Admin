import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';

import '../constants.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final Widget? icon;
  final String hint;
  final bool isPassword;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;
  final TextInputType type;
  final TextInputAction? textInputAction;

  const AppTextFormField({
    Key? key,
    this.label = '',
    this.icon,
    this.textInputAction,
    required this.hint,
    this.type = TextInputType.text,
    this.isPassword = false,
    this.onChanged,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isShown = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (BuildContext context, state) {
        return Container(
          // height: 49.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).primaryColorLight,
          ),
          child: TextFormField(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter ${widget.hint}';
              } else {
                return null;
              }
            },
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
            keyboardType: widget.type,
            controller: widget.textEditingController,
            obscureText: widget.isPassword ? isShown : false,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MainCubit.get(context).isDark
                      ? HexColor(darkBlue)
                      : secondaryVariant,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              labelText: widget.hint,
              labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: HexColor(mainColorL),
                height: 4,
              ),
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: HexColor(mainColorL),
                  ),
              contentPadding: const EdgeInsetsDirectional.only(
                start: 15.0,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      padding: const EdgeInsets.all(12.0),
                      onPressed: () {
                        setState(() {
                          isShown = !isShown;
                        });
                      },
                      icon: Image(
                        image: isShown
                            ? const AssetImage('assets/images/eye_slash.png')
                            : const AssetImage('assets/images/eye.png'),
                      ),
                    )
                  : widget.icon == null
                      ? null
                      : Padding(
                          padding: const EdgeInsetsDirectional.all(12.0),
                          child: widget.icon,
                        ),
            ),
          ),
        );
      },
    );
  }
}
