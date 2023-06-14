import 'package:deeptc/deeptc.dart' as deeptc;
import 'package:test/test.dart';

void main() {
  test('translate()', () async {
    expect(await deeptc.translate('Hello!', to: 'pt'), contains('Olá'));
    expect(await deeptc.translate('Hello!', to: 'hi'), contains('नमस्ते'));
    expect(await deeptc.translate('Hello!', to: 'ja'), contains('こんにちは'));
    expect(await deeptc.translate('Hello!', to: 'zh-CN'), contains('你好'));
    expect(await deeptc.translate('Hello!', to: 'es'), contains('Hola'));
    expect(await deeptc.translate('Hello!', to: 'ko'), contains('안녕하세요'));
    expect(await deeptc.translate('Hello!', to: 'ru'), contains('Привет'));
  });
}
