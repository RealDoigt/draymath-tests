import raymath;
import draymath;
import test_cases;

void main()
{
    TestCase[string] tcs;
    
    tcs["clamp"] = new TestCaseFFFF(cast(float function(float, float, float))&raymath.Clamp, cast(float function(float, float, float))&draymath.Clamp);
    
    
} 
