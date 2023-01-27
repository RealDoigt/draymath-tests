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

class TestCaseTFFF(T) : TestCase
{
    private T function(float, float, float) rmf, dmf;
    
    this(T function(float, float, float) rmf, T function(float, float, float) dmf)
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

class TestCaseOrthonormalize : TestCase
{
    private void function(Vector3*, Vector3*) rmf, dmf;
    
    this(void function(Vector3*, Vector3*) rmf, void function(Vector3*, Vector3*) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0r = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1r = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r));
                 
            auto v0d = v0r, v1d = v1r;
            rmf(&v0r, &v1r);
            dmf(&v0d, &v1d);
            
            if(v0r != v0d || v1r != v1d) return false;
        }
        
        return true;
    }
}

class TestCaseV3Transform : TestCase
{
    private Vector3 function(Vector3, Matrix) rmf, dmf;
    
    this(Vector3 function(Vector3, Matrix) rmf, Vector3 function(Vector3, Matrix) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = Matrix
                      (
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      ); 
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseV3RotateByQuaternion : TestCase
{
    private Vector3 function(Vector3, Vector4) rmf, dmf;
    
    this(Vector3 function(Vector3, Vector4) rmf, Vector3 function(Vector3, Vector4) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = Vector4
                      (
                        uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      );
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseV3Unproject : TestCase
{
    private Vector3 function(Vector3, Matrix, Matrix) rmf, dmf;
    
    this(Vector3 function(Vector3, Matrix, Matrix) rmf, Vector3 function(Vector3, Matrix, Matrix) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)), 
                 v1 = Matrix
                      (
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      ),
                 v2 = Matrix
                      (
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      );
                 
            if (rmf(v0, v1, v2) != dmf(v0, v1, v2)) return false;
        }
        
        return true;
    }
}

class TestCaseF3V3 : TestCase
{
    private float3 function(Vector3) rmf, dmf;
    
    this(float3 function(Vector3) rmf, float3 function(Vector3) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector3(uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r)),
                 v1 = rmf(v0),
                 v2 = dmf(v0);
            
            for (size_t j; j < 3; ++j) 
                if(v1.v[j] != v2.v[j]) 
                    return false;
        }
        
        return true;
    }
}

class TestCaseTM(T) : TestCase
{
    private T function(Matrix) rmf, dmf;
    
    this(T function(Matrix) rmf, T function(Matrix) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Matrix
                      (
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      );
                      
            if (rmf(v0) != dmf(v0)) return false;
        }
        
        return true;
    }
}

class TestCaseMMM : TestCase
{
    private Matrix function(Matrix, Matrix) rmf, dmf;
    
    this(Matrix function(Matrix, Matrix) rmf, Matrix function(Matrix, Matrix) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Matrix
                      (
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      ),
                 v1 = Matrix
                      (
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), 
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r), uniform(0f, rangeMax, r), uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      );
                      
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}

class TestCaseMRotate : TestCase
{
    private Matrix function(Vector3, float) rmf, dmf;
    
    this(Matrix function(Vector3, float) rmf, Matrix function(Vector3, float) dmf)
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

class TestCaseMF : TestCase
{
    private Matrix function(float) rmf, dmf;
    
    this(Matrix function(float) rmf, Matrix function(float) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = uniform(0f, rangeMax, r);
            if (rmf(v0) != dmf(v0)) return false;
        }
        
        return true;
    }
}

class TestCaseMDDDDDD : TestCase
{
    private Matrix function(double, double, double, double, double, double) rmf, dmf;
    
    this
    (
        Matrix function(double, double, double, double, double, double) rmf, 
        Matrix function(double, double, double, double, double, double) dmf
    )
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = uniform(.0, rangeMax, r), 
                 v1 = uniform(.0, rangeMax, r),
                 v2 = uniform(.0, rangeMax, r),
                 v3 = uniform(.0, rangeMax, r),
                 v4 = uniform(.0, rangeMax, r),
                 v5 = uniform(.0, rangeMax, r);
                 
            if (rmf(v0, v1, v2, v3, v4, v5) != dmf(v0, v1, v2, v3, v4, v5)) return false;
        }
        
        return true;
    }
}

class TestCaseMPerspective : TestCase
{
    private Matrix function(double, double, double, double) rmf, dmf;
    
    this
    (
        Matrix function(double, double, double, double) rmf, 
        Matrix function(double, double, double, double) dmf
    )
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = uniform(.0, rangeMax, r), 
                 v1 = uniform(.0, rangeMax, r),
                 v2 = uniform(.0, rangeMax, r),
                 v3 = uniform(.0, rangeMax, r);
                 
            if (rmf(v0, v1, v2, v3) != dmf(v0, v1, v2, v3)) return false;
        }
        
        return true;
    }
}

class TestCaseTV4V4(T) : TestCase
{
    private T function(Vector4, Vector4) rmf, dmf;
    
    this(T function(Vector4, Vector4) rmf, T function(Vector4, Vector4) dmf)
    {
        this.rmf = rmf;
        this.dmf = dmf;
    }
    
    override bool test()
    {
        for (size_t i; i < testQty; ++i)
        {
            auto v0 = Vector4
                      (
                        uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r),
                        uniform(0f, rangeMax, r)
                      ), 
                 v1 = Vector4
                      (
                       uniform(0f, rangeMax, r),
                       uniform(0f, rangeMax, r),
                       uniform(0f, rangeMax, r),
                       uniform(0f, rangeMax, r)
                      );
                 
            if (rmf(v0, v1) != dmf(v0, v1)) return false;
        }
        
        return true;
    }
}