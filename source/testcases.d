module test_cases;
import std.random;

enum testQty = 500;

abstract class TestCase
{
    bool test();
}

class TestCaseFFFF : TestCase
{
    private float delegate(float, float, float) rmf, dmf;
    
    this(float delegate(float, float, float) rmf, float delegate(float, float, float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = uniform!float(0f, 100f), 
                 v1 = uniform!float(0f, 100f),
                 v2 = uniform!float(0f, 100f);
                 
            if (rmf(v0, v1, v2) != dmf(v0, v1, v2)) return false;
        }
        
        return true;
    }
}