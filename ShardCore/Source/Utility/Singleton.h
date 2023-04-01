#pragma once
#include <cassert>

namespace Shard
{
    template<typename T>
    class Singleton
    {
    public:
        static bool HasInstance() { return m_instance; }
        
        static T& GetInstance()
        {
            assert(HasInstance() && "There is no instance to retrieve!");
            return *m_instance;
        }
        
        static T& CreateSingleton()
        {
            assert(!m_instance && "Instance already exists!");
            m_instance = new T();
            return GetInstance();
        }

        static void DestroySingleton()
        {
            assert(m_instance && "There is no instance to destroy!");
            delete m_instance;
        }
        
    private:
        inline static T* m_instance = nullptr;
    };
}