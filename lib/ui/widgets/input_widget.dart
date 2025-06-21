import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatefulWidget {
  final String lable;
  final String placeholder;
  final bool isPassword;
  final bool isDate;
  final void Function(DateTime)? onDateSelected;
  final TextEditingController? controller;

  const InputWidget({
    super.key,
    required this.lable,
    required this.placeholder,
    this.isPassword = false,
    this.isDate = false,
    this.onDateSelected,
    this.controller
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1945),
      lastDate: DateTime(2300),
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            color: Color(0xFF34363E),
          ),
        ),
        Gap(8),
        TextField(
          controller: controller,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: Color(0xFF19437d),
          ),
          obscureText: widget.isPassword,
          readOnly: widget.isDate,
          onTap: widget.isDate
              ? () {
                  selectDate(context);
                }
              : null,
          cursorColor: Color(0xFF19437d),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: Color(0xFF7D7E83),
            ),
            contentPadding: EdgeInsets.all(16),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Color(0xFF19437d), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
