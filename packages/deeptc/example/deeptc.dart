import 'package:deeptc/deeptc.dart' as deeptc;

Future<void> main(List<String> arguments) async {
  // Oi, bem vindo ao clube!
  print(await deeptc.translate('Hi, welcome to the club!', to: 'pt'));
}
