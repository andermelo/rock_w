import 'package:flutter/material.dart';
import 'package:rock_w/core/style/colors.dart';
import 'package:rock_w/features/weather_current/presenter/current_presenter.dart';

class FilterSearchInputWidget extends StatefulWidget {
  const FilterSearchInputWidget({super.key, required this.presenter});
  final CurrentPresenter presenter;

  @override
  State<FilterSearchInputWidget> createState() =>
      _FilterSearchInputWidgetState();
}

class _FilterSearchInputWidgetState extends State<FilterSearchInputWidget> {
  Color _fillColor = AppColors.orange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            _fillColor = AppColors.orange.withOpacity(1.0);
          } else {
            _fillColor = AppColors.orange;
          }
          setState(() {});
        },
        child: TextField(
          onChanged: (value) {
            if (value.isEmpty) {
              widget.presenter.resetFilter();
              return;
            }
            widget.presenter.filterWeatherByCityName(value);
          },
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white),
            prefixIconColor: Colors.white,
            focusColor: Colors.black,
            fillColor: _fillColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange, width: 1.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange, width: 1.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            hintText: "Search...".toUpperCase(),
            isCollapsed: false,
            prefixIcon: const Icon(Icons.search),
            filled: true,
          ),
        ),
      ),
    );
  }
}
