module test_cases;
import std.random;

enum testQty = 500;
auto r = Random(unpredictableSeed);

abstract class TestCase
{
    bool test();
}

class TestCaseFFFF : TestCase
{
    private float function(float, float, float) rmf, dmf;
    
    this(float function(float, float, float) rmf, float function(float, float, float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = uniform(0f, 10_000f, r), 
                 v1 = uniform(0f, 10_000f, r),
                 v2 = uniform(0f, 10_000f, r);
                 
            if (rmf(v0, v1, v2) != dmf(v0, v1, v2)) return false;
        }
        
        return true;
    }
}