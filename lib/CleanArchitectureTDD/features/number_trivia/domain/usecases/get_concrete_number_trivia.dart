import 'package:all_flutter_gives/CleanArchitectureTDD/core/error/failures.dart';
import 'package:all_flutter_gives/CleanArchitectureTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:all_flutter_gives/CleanArchitectureTDD/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call({@required int number}) async{
    return await repository.getConcreteNumberTrivia(number);
  }
}
