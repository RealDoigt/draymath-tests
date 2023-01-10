module test_cases;
import std.random;
import std.stdio;
import raylib;

enum testQty = 500, rangeMax = 10_000f;
auto r = Random(79_981_964u);

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
            auto v0 = uniform(0f, rangeMax, r), 
                 v1 = uniform(0f, rangeMax, r),
                 v2 = uniform(0f, rangeMax, r);
                 
            if (rmf(v0, v1, v2) != dmf(v0, v1, v2)) return false;
        }
        
        return true;
    }
}

class TestCaseRemap : TestCase
{
    private float function(float, float, float, float) rmf, dmf;
    
    this(float function(float, float, float, float) rmf, float function(float, float, float, float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = uniform(0f, rangeMax, r), 
                 v1 = uniform(v0 + 1, rangeMax, r),
                 v2 = uniform(0f, rangeMax, r),
                 v3 = uniform(v2 + 1, rangeMax, r);
                 
            if (rmf(v0, v1, v2, v3) != dmf(v0, v1, v2, v3))
            {/*
                "Remap rmf(v0, v1, v2, v3):%f".writefln(rmf(v0, v1, v2, v3));
                "Remap dmf(v0, v1, v2, v3):%f".writefln(dmf(v0, v1, v2, v3));*/
                return false;
            }
        }
        
        return true;
    }
}

class TestCaseT(T) : TestCase
{
    private T function() rmf, dmf;
    
    this(T function() rmf, T function() dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        return rmf() == dmf();
    }
}

class TestCaseTV2V2(T) : TestCase
{
    private T function(Vector2, Vector2) rmf, dmf;
    
    this(T function(Vector2, Vector2) rmf, T function(Vector2, Vector2) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector2(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = Vector2(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r));
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseV2V2F : TestCase
{
    private Vector2 function(Vector2, float) rmf, dmf;
    
    this(Vector2 function(Vector2, float) rmf, Vector2 function(Vector2, float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector2(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = uniform(0f, rangeMax, r);
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseTV2(T) : TestCase
{
    private T function(Vector2) rmf, dmf;
    
    this(T function(Vector2) rmf, T function(Vector2) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector2(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r));
            if (rmf(v0) != dmf(v0)) return false;
        }
        
        return true;
    }
}

class TestCaseV2V2V2F : TestCase
{
    private Vector2 function(Vector2, Vector2, float) rmf, dmf;
    
    this(Vector2 function(Vector2, Vector2, float) rmf, Vector2 function(Vector2, Vector2, float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector2(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)),
                 v1 = Vector2(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)),
                 v2 = uniform(0f, rangeMax, r);
                 
            if (rmf(v0, v1, v2) != dmf(v0, v1, v2)) return false;
        }
        
        return true;
    }
}

class TestCaseTV3V3(T) : TestCase
{
    private T function(Vector3, Vector3) rmf, dmf;
    
    this(T function(Vector3, Vector3) rmf, T function(Vector3, Vector3) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r));
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseV3V3F : TestCase
{
    private Vector3 function(Vector3, float) rmf, dmf;
    
    this(Vector3 function(Vector3, float) rmf, Vector3 function(Vector3, float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = uniform(0f, rangeMax, r);
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseTV3(T) : TestCase
{
    private T function(Vector3) rmf, dmf;
    
    this(T function(Vector3) rmf, T function(Vector3) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r));
            if (rmf(v0) != dmf(v0)) return false;
        }
        
        return true;
    }
}