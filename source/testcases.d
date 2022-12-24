module text_cases;

abstract class TestCase
{
    bool test();
}

class TestCaseFFFF : TestCase
{
    private float delegate(float, float, float) rmf, dmf;
    
    this(float delegate(float, float, float) rmf, float delegate(float, float, float) dmf)
    {
    }
}