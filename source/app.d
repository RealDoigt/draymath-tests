import raymath;
import draymath;
import test_cases;

void main()
{
    TestCase[string] tcs;
    
    tcs["clamp"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Clamp, cast(float function(float, float, float))&dClamp);
    
    tcs["lerp"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Lerp, cast(float function(float, float, float))&dLerp);
    
} 
