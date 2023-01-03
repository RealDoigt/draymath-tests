import raymath;
import draymath;
import std.stdio;
import test_cases;

void main()
{

    // BEGIN Adding Function Test Cases
    TestCase[string] tcs;
    
    // returns float, 3 float params
    tcs["Clamp"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Clamp, cast(float function(float, float, float))&dClamp);
    tcs["Lerp"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Lerp, cast(float function(float, float, float))&dLerp);
    tcs["Normalize"] = 
    new TestCaseFFFF(cast(float function(float, float, float))&Normalize, cast(float function(float, float, float))&dNormalize);
    // returns float, 4 float params
    tcs["Remap"] = 
    new TestCaseFFFFF(cast(float function(float, float, float, float))&Remap, cast(float function(float, float, float, float))&Remap);
    // returns Vector2, no params
    tcs["Vector2Zero"] = 
    new TestCaseFFFFF(cast(Vector2 function())&Vector2Zero, cast(Vector2 function())&dVector2Zero);
    tcs["Vector2One"] = 
    new TestCaseFFFFF(cast(Vector2 function())&Vector2One, cast(Vector2 function())&dVector2One);
    // END Function Test Cases
    
    foreach (key, tc; tcs)
    {
        "%s: %s".writefln(key, tc.test);
    }
} 
