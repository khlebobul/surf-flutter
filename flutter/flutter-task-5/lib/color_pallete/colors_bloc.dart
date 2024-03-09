import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_state.dart';
import '/data/colors_repository.dart';
import 'colors_events.dart';

// Блок для стейт-менеджмента экрана доступных цветов
class ColorsPalleteBloc extends Bloc<ColorsPalleteEvent, ColorsPalleteState> {
  ColorsPalleteBloc({required this.colorsRepository})
      : super(ColorsPalleteLoadingState()) {
    on<ColorsPalleteEventLoad>((event, emit) => _loadColors(event, emit));
  }
  // Репозиторий доступных цветов
  final IColorsRepository colorsRepository;
  // Загрузка цветов из репозитория
  Future<void> _loadColors(
      ColorsPalleteEventLoad event, Emitter<ColorsPalleteState> emit) async {
    final colors = colorsRepository.getColors();
    emit(
      ColorsPalleteLoadedState(colors: colors),
    );
  }
}