import raymath;
import draymath;
import test_cases;

void main()
{
    TestCase[string] tcs;
    
    tcs["Clamp"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Clamp, cast(float function(float, float, float))&dClamp);
    tcs["Lerp"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Lerp, cast(float function(float, float, float))&dLerp);
    tcs["Normalize"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Normalize, cast(float function(float, float, float))&dNormalize);
    
} 
