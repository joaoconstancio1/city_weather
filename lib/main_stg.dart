// coverage:ignore-file
import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.stg;
  await runner.main();
}
