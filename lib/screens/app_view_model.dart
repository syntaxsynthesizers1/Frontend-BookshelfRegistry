import 'dart:io';

import 'package:book_stack/data/api_config/local_cache.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final readingPageProvider = StateProvider<int>((ref) => 0);
final startRatingProvider = StateProvider<int>((ref) => 0);

final lastReadProvider =
    StateProvider<OldBookModel?>((ref) => locator<LocalCache>().getLastRead());

final bookModelsProvider = StateProvider<List<OldBookModel>>(
    (ref) => locator<LocalCache>().loadBookModels());
