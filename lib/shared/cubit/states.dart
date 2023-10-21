abstract class Appstates{}
class Initial extends Appstates{}

class BottomNaveState extends Appstates{}

class LoadingsnewsState extends Appstates{}

class GetbusineesnewsState extends Appstates{}
class ErrornewsState extends Appstates
{
  late final String error;
  ErrornewsState(this.error);
}
class chand extends Appstates{}