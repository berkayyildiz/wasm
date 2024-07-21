#include <iostream>
#include <memory>

class Resource
{
public:
  Resource() { std::cout << "Resource acquired\n"; }
  ~Resource() { std::cout << "Resource released\n"; }
  virtual void doSomething() = 0;
};

class AltRes : public Resource
{
public:
  AltRes() { std::cout << "AltRes acquired\n"; }
  ~AltRes() { std::cout << "AltRes released\n"; }
  void doSomething() override { std::cout << "ALT Resource doing something\n"; }
};

void processResource(std::shared_ptr<Resource> ptr)
{
  ptr->doSomething();
}

int main()
{
  // Resource *resPTRRaw = new Resource();
  // delete resPTRRaw;

  // std::shared_ptr<Resource> resPtrShared = std::make_shared<Resource>();
  // std::cout << resPtrShared.use_count() << std::endl;
  // std::shared_ptr<Resource> resPtr2Shared = resPtrShared;
  // std::cout << resPtrShared.use_count() << std::endl;

  Resource *res = new Resource();
  res->doSomething();

  std::cout << "Exiting main\n";
  return 0;
}