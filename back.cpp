#include <iostream>
#include <list>
#include <memory>
using namespace std;

class User
{
public:
  virtual void getPermissions()
  {
    cout << "User can see some" << endl;
  }
};

class SuperUser : public User
{
public:
  void getPermissions()
  {
    cout << "SuperUser can see all!!" << endl;
  }
};

float sumNumbers(float a, float b)
{
  return a + b;
}

float sumNumbers(float a, float b, float c)
{
  return a + b + c;
}

struct C
{
  virtual string which() const { return "C"; }
};

struct D : public C
{
  string which() const { return "D"; }
};

int main()
{
  // cout << sumNumbers(1, 2) << endl;
  // cout << sumNumbers(1, 2, 3) << endl;

  unique_ptr<int> unPtr1 = make_unique<int>(26);
  unique_ptr<int> unPtr2 = move(unPtr1);

  // cout << *unPtr1 << endl;
  cout << *unPtr2 << endl;

  cout << (new C)->which() << endl;
  cout << static_cast<C *>(new D)->which() << endl;

  // User u;
  // SuperUser s;
  // list<User *> users;
  // users.push_back(&u);
  // users.push_back(&s);
  // u.getPermissions();
  // for (User *userPtr : users)
  // {
  //   userPtr->getPermissions();
  // }

  // cin.get();
}