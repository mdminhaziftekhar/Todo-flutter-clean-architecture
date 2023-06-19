import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_clean_architecture/data/source/files_impl.dart';

import 'files.dart';

final filesProvider = Provider<Files>((ref) {
  return FilesImpl();
});
