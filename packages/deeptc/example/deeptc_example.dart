import 'package:deeptc/deeptc.dart' as deeptc;

Future<void> main(List<String> arguments) async {
  print(await deeptc.translate('Hi, welcome to the club!', to: 'pt'));
  // >> Oi, bem vindo ao clube!
}
