#include <ShardCore.h>

using namespace Shard;

void SayHello()
{
    printf("Hello World!");
}

int main()
{
    Delegate<void()> sayHelloDelegate{SayHello};
    sayHelloDelegate();
}