import raylib;
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
    // returns float, 4 float params, TODO TEST -> this returns false even when compared against itself.
    tcs["Remap"] = 
    new TestCaseFFFFF(cast(float function(float, float, float, float))&Remap, cast(float function(float, float, float, float))&dRemap);
    // returns Vector2, no params
    tcs["Vector2Zero"] = 
    new TestCaseV2(cast(Vector2 function())&Vector2Zero, cast(Vector2 function())&dVector2Zero);
    tcs["Vector2One"] = 
    new TestCaseV2(cast(Vector2 function())&Vector2One, cast(Vector2 function())&dVector2One);
    // returns Vector2, 2 Vector2 params
    tcs["Vector2Add"] = 
    new TestCaseTV2V2(cast(Vector2 function(Vector2, Vector2))&Vector2Add, cast(Vector2 function(Vector2, Vector2))&dVector2Add);
    tcs["Vector2Subtract"] = 
    new TestCaseTV2V2(cast(Vector2 function(Vector2, Vector2))&Vector2Subtract, cast(Vector2 function(Vector2, Vector2))&dVector2Subtract);
    tcs["Vector2Multiply"] = 
    new TestCaseTV2V2(cast(Vector2 function(Vector2, Vector2))&Vector2Multiply, cast(Vector2 function(Vector2, Vector2))&dVector2Multiply);
    tcs["Vector2Divide"] = 
    new TestCaseTV2V2(cast(Vector2 function(Vector2, Vector2))&Vector2Divide, cast(Vector2 function(Vector2, Vector2))&dVector2Divide);
    tcs["Vector2Reflect"] = 
    new TestCaseTV2V2(cast(Vector2 function(Vector2, Vector2))&Vector2Reflect, cast(Vector2 function(Vector2, Vector2))&dVector2Reflect);
    // return float, 2 Vector2 params
    tcs["Vector2DotProduct"] = 
    new TestCaseTV2V2(cast(float function(Vector2, Vector2))&Vector2DotProduct, cast(float function(Vector2, Vector2))&dVector2DotProduct);
    tcs["Vector2Distance"] = 
    new TestCaseTV2V2(cast(float function(Vector2, Vector2))&Vector2Distance, cast(float function(Vector2, Vector2))&dVector2Distance);
    tcs["Vector2Angle"] = 
    new TestCaseTV2V2(cast(float function(Vector2, Vector2))&Vector2Angle, cast(float function(Vector2, Vector2))&dVector2Angle);
    // returns Vector2, Vector2 and float params
    tcs["Vector2AddValue"] = 
    new TestCaseV2V2F(cast(Vector2 function(Vector2, float))&Vector2AddValue, cast(Vector2 function(Vector2, float))&dVector2AddValue);
    tcs["Vector2SubtractValue"] = 
    new TestCaseV2V2F(cast(Vector2 function(Vector2, float))&Vector2SubtractValue, cast(Vector2 function(Vector2, float))&dVector2SubtractValue);
    tcs["Vector2Scale"] = 
    new TestCaseV2V2F(cast(Vector2 function(Vector2, float))&Vector2Scale, cast(Vector2 function(Vector2, float))&dVector2Scale);
    tcs["Vector2Rotate"] = 
    new TestCaseV2V2F(cast(Vector2 function(Vector2, float))&Vector2Rotate, cast(Vector2 function(Vector2, float))&dVector2Rotate);
    // returns float, Vector2 param
    tcs["Vector2Length"] = 
    new TestCaseTV2(cast(float function(Vector2))&Vector2Length, cast(float function(Vector2))&dVector2Length);
    tcs["Vector2LengthSqr"] = 
    new TestCaseTV2(cast(float function(Vector2))&Vector2LengthSqr, cast(float function(Vector2))&dVector2LengthSqr);
    // returns Vector2, Vector2 param
    tcs["Vector2Negate"] = 
    new TestCaseTV2(cast(Vector2 function(Vector2))&Vector2Negate, cast(Vector2 function(Vector2))&dVector2Negate);
    tcs["Vector2Normalize"] = 
    new TestCaseTV2(cast(Vector2 function(Vector2))&Vector2Normalize, cast(Vector2 function(Vector2))&dVector2Normalize);
    // returns Vector2, 2 Vector2 and 1 float params
    tcs["Vector2Lerp"] = 
    new TestCaseV2V2V2F(cast(Vector2 function(Vector2, Vector2, float))&Vector2Lerp, cast(Vector2 function(Vector2, Vector2, float))&dVector2Lerp);
    tcs["Vector2MoveTowards"] = 
    new TestCaseV2V2V2F(cast(Vector2 function(Vector2, Vector2, float))&Vector2MoveTowards, cast(Vector2 function(Vector2, Vector2, float))&dVector2MoveTowards);
    // END Function Test Cases
    
    foreach (key, tc; tcs) "%s: %s".writefln(key, tc.test);
} 
