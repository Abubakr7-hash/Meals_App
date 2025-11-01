import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/data/dummy_data.dart';

final mealsProvider = Provider((Ref ref) {
  return dummyMeals;
});
