interface Callback
{
  void call();
}

boolean IsPowerOfTwo(int x)
{
    return (x != 0) && ((x & (x - 1)) == 0);
}