import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'color_pallete/colors_events.dart';

import 'color_pallete/colors_bloc.dart';
import 'data/colors_repository.dart';
import 'widgets/clipboard.dart';
import '/screens/color_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 200,
            behavior: SnackBarBehavior.floating,
            insetPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
        ),
        home: BlocProvider(
          // Загружает цвета палитры для отображения
          create: (context) => ColorsPalleteBloc(
            colorsRepository: ColorsRepositoryCurrent(),
          )..add(
              ColorsPalleteEventLoad(),
            ),
          child: Provider(
            create: (context) => ClipboardWriteInteractor(
                clipboardWriter: ClipboardWriter.instance),
            child: const PalleteScreen(),
          ),
        ));
  }
}