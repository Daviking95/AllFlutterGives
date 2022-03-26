
import 'package:all_flutter_gives/CleanArchitectureTDD/core/error/failures.dart';
import 'package:all_flutter_gives/CleanArchitectureTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}