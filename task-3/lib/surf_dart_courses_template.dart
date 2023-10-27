class Sneaker {
  final String brand;
  final String model;
  final String color;
  final double size; // Размер обуви (US)
  final bool isHighTop; // Высокие или низкие кроссовки
  final ShoeLace lace; // Шнурки кроссовок

  Sneaker({
    required this.brand,
    required this.model,
    required this.color,
    required this.size,
    required this.isHighTop,
    required this.lace,
  });

  Sneaker.basic({
    required this.brand,
    required this.model,
  })  : color = "White",
        size = 10.0,
        isHighTop = false,
        lace = ShoeLace.basic();

  void wear() {
    print("Wearing ${brand} ${model} sneakers...");
    // Здесь был бы код для надевания кроссовок
  }

  void tieShoelaces() {
    print("Tying shoelaces...");
    lace.tie();
  }
}

class ShoeLace {
  final int length; // Длина шнурков в см
  final String material; // Материал шнурков

  ShoeLace({
    required this.length,
    required this.material,
  });

  ShoeLace.basic()
      : length = 120,
        material = "Nylon";

  void tie() {
    print("Tying shoelaces...");
    // Здесь был бы код для завязывания шнурков
  }
}

void main() {
  // Создание кроссовок с помощью основного конструктора
  Sneaker mySneakers = Sneaker(
    brand: "Nike",
    model: "Air Max 90",
    color: "Black/White",
    size: 9.5,
    isHighTop: false,
    lace: ShoeLace(
      length: 150,
      material: "Polyester",
    ),
  );

  // Создание кроссовок с помощью альтернативного конструктора
  Sneaker basicSneakers = Sneaker.basic(
    brand: "Adidas",
    model: "Superstar",
  );

  // Использование методов кроссовок
  mySneakers.wear();
  mySneakers.tieShoelaces();

  // Использование вложенного объекта
  print("My shoelaces are made of ${mySneakers.lace.material}.");
}
