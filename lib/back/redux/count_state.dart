///第二步 创建State
class CountState{
  int _count;
  get count => _count;
  CountState(this._count);
  CountState.initState():_count=0;

}