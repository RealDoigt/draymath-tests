import raylib;
import raymath;
import draymath;
import std.stdio;
import test_cases;
import std.algorithm;

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
    new TestCaseRemap(cast(float function(float, float, float, float))&Remap, cast(float function(float, float, float, float))&dRemap);
    // returns Vector2, no params
    tcs["Vector2Zero"] = 
    new TestCaseT!Vector2(cast(Vector2 function())&Vector2Zero, cast(Vector2 function())&dVector2Zero);
    tcs["Vector2One"] = 
    new TestCaseT!Vector2(cast(Vector2 function())&Vector2One, cast(Vector2 function())&dVector2One);
    // returns Vector2, 2 Vector2 params
    tcs["Vector2Add"] = 
    new TestCaseTV2V2!Vector2(cast(Vector2 function(Vector2, Vector2))&Vector2Add, cast(Vector2 function(Vector2, Vector2))&dVector2Add);
    tcs["Vector2Subtract"] = 
    new TestCaseTV2V2!Vector2(cast(Vector2 function(Vector2, Vector2))&Vector2Subtract, cast(Vector2 function(Vector2, Vector2))&dVector2Subtract);
    tcs["Vector2Multiply"] = 
    new TestCaseTV2V2!Vector2(cast(Vector2 function(Vector2, Vector2))&Vector2Multiply, cast(Vector2 function(Vector2, Vector2))&dVector2Multiply);
    tcs["Vector2Divide"] = 
    new TestCaseTV2V2!Vector2(cast(Vector2 function(Vector2, Vector2))&Vector2Divide, cast(Vector2 function(Vector2, Vector2))&dVector2Divide);
    tcs["Vector2Reflect"] = 
    new TestCaseTV2V2!Vector2(cast(Vector2 function(Vector2, Vector2))&Vector2Reflect, cast(Vector2 function(Vector2, Vector2))&dVector2Reflect);
    // return float, 2 Vector2 params
    tcs["Vector2DotProduct"] = 
    new TestCaseTV2V2!float(cast(float function(Vector2, Vector2))&Vector2DotProduct, cast(float function(Vector2, Vector2))&dVector2DotProduct);
    tcs["Vector2Distance"] = 
    new TestCaseTV2V2!float(cast(float function(Vector2, Vector2))&Vector2Distance, cast(float function(Vector2, Vector2))&dVector2Distance);
    tcs["Vector2Angle"] = 
    new TestCaseTV2V2!float(cast(float function(Vector2, Vector2))&Vector2Angle, cast(float function(Vector2, Vector2))&dVector2Angle);
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
    new TestCaseTV2!float(cast(float function(Vector2))&Vector2Length, cast(float function(Vector2))&dVector2Length);
    tcs["Vector2LengthSqr"] = 
    new TestCaseTV2!float(cast(float function(Vector2))&Vector2LengthSqr, cast(float function(Vector2))&dVector2LengthSqr);
    // returns Vector2, Vector2 param
    tcs["Vector2Negate"] = 
    new TestCaseTV2!Vector2(cast(Vector2 function(Vector2))&Vector2Negate, cast(Vector2 function(Vector2))&dVector2Negate);
    tcs["Vector2Normalize"] = 
    new TestCaseTV2!Vector2(cast(Vector2 function(Vector2))&Vector2Normalize, cast(Vector2 function(Vector2))&dVector2Normalize);
    // returns Vector2, 2 Vector2 and 1 float params
    tcs["Vector2Lerp"] = 
    new TestCaseV2V2V2F(cast(Vector2 function(Vector2, Vector2, float))&Vector2Lerp, cast(Vector2 function(Vector2, Vector2, float))&dVector2Lerp);
    tcs["Vector2MoveTowards"] = 
    new TestCaseV2V2V2F(cast(Vector2 function(Vector2, Vector2, float))&Vector2MoveTowards, cast(Vector2 function(Vector2, Vector2, float))&dVector2MoveTowards);
    // returns Vector3, no params
    tcs["Vector3Zero"] = 
    new TestCaseT!Vector3(cast(Vector3 function())&Vector3Zero, cast(Vector3 function())&dVector3Zero);
    tcs["Vector3One"] = 
    new TestCaseT!Vector3(cast(Vector3 function())&Vector3One, cast(Vector3 function())&dVector3One);
    // returns Vector3, 2 Vector3 params
    tcs["Vector3Add"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Add, cast(Vector3 function(Vector3, Vector3))&dVector3Add);
    tcs["Vector3Subtract"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Subtract, cast(Vector3 function(Vector3, Vector3))&dVector3Subtract);
    tcs["Vector3Multiply"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Multiply, cast(Vector3 function(Vector3, Vector3))&dVector3Multiply);
    tcs["Vector3Divide"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Divide, cast(Vector3 function(Vector3, Vector3))&dVector3Divide);
    tcs["Vector3Reflect"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Reflect, cast(Vector3 function(Vector3, Vector3))&dVector3Reflect);
    tcs["Vector3CrossProduct"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3CrossProduct, cast(Vector3 function(Vector3, Vector3))&dVector3CrossProduct);
    tcs["Vector3Min"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Min, cast(Vector3 function(Vector3, Vector3))&dVector3Min);
    tcs["Vector3Max"] = 
    new TestCaseTV3V3!Vector3(cast(Vector3 function(Vector3, Vector3))&Vector3Max, cast(Vector3 function(Vector3, Vector3))&dVector3Max);
    // return float, 2 Vector3 params
    tcs["Vector3DotProduct"] = 
    new TestCaseTV3V3!float(cast(float function(Vector3, Vector3))&Vector3DotProduct, cast(float function(Vector3, Vector3))&dVector3DotProduct);
    tcs["Vector3Distance"] = 
    new TestCaseTV3V3!float(cast(float function(Vector3, Vector3))&Vector3Distance, cast(float function(Vector3, Vector3))&dVector3Distance);
    tcs["Vector3Angle"] = 
    new TestCaseTV3V3!float(cast(float function(Vector3, Vector3))&Vector3Angle, cast(float function(Vector3, Vector3))&dVector3Angle);
    // returns Vector3, Vector3 and float params
    tcs["Vector3AddValue"] = 
    new TestCaseV3V3F(cast(Vector3 function(Vector3, float))&Vector3AddValue, cast(Vector3 function(Vector3, float))&dVector3AddValue);
    tcs["Vector3SubtractValue"] = 
    new TestCaseV3V3F(cast(Vector3 function(Vector3, float))&Vector3SubtractValue, cast(Vector3 function(Vector3, float))&dVector3SubtractValue);
    tcs["Vector3Scale"] = 
    new TestCaseV3V3F(cast(Vector3 function(Vector3, float))&Vector3Scale, cast(Vector3 function(Vector3, float))&dVector3Scale);
    // returns float, Vector3 param
    tcs["Vector3Length"] = 
    new TestCaseTV3!float(cast(float function(Vector3))&Vector3Length, cast(float function(Vector3))&dVector3Length);
    tcs["Vector3LengthSqr"] = 
    new TestCaseTV3!float(cast(float function(Vector3))&Vector3LengthSqr, cast(float function(Vector3))&dVector3LengthSqr);
    // returns Vector3, Vector3 param
    tcs["Vector3Perpendicular"] = 
    new TestCaseTV3!Vector3(cast(Vector3 function(Vector3))&Vector3Perpendicular, cast(Vector3 function(Vector3))&dVector3Perpendicular);
    tcs["Vector3Negate"] = 
    new TestCaseTV3!Vector3(cast(Vector3 function(Vector3))&Vector3Negate, cast(Vector3 function(Vector3))&dVector3Negate);
    tcs["Vector3Normalize"] = 
    new TestCaseTV3!Vector3(cast(Vector3 function(Vector3))&Vector3Normalize, cast(Vector3 function(Vector3))&dVector3Normalize);
    // returns nothing, 2 Vector3 pointer params
    tcs["Vector3OrthoNormalize"] =
    new TestCaseOrthonormalize(cast(void function(Vector3*, Vector3*))&Vector3OrthoNormalize, cast(void function(Vector3*, Vector3*))&dVector3OrthoNormalize);
    // returns Vector3, Vector3 and Matrix params
    tcs["Vector3Transform"] = 
    new TestCaseV3Transform(cast(Vector3 function(Vector3, Matrix))&Vector3Transform, cast(Vector3 function(Vector3, Matrix))&dVector3Transform);
    // returns Vector3, Vector3 and Vector4 params
    tcs["Vector3RotateByQuaternion"] = 
    new TestCaseV3RotateByQuaternion(cast(Vector3 function(Vector3, Vector4))&Vector3RotateByQuaternion, cast(Vector3 function(Vector3, Vector4))&dVector3RotateByQuaternion);
    // returns Vector3, Vector3 and 2 Matrix params
    tcs["Vector3Unproject"] = 
    new TestCaseV3Unproject(cast(Vector3 function(Vector3, Matrix, Matrix))&Vector3Unproject, cast(Vector3 function(Vector3, Matrix, Matrix))&dVector3Unproject);
    // returns float3, Vector3 param
    tcs["Vector3ToFloatV"] = 
    new TestCaseF3V3(cast(float3 function(Vector3))&Vector3ToFloatV, cast(float3 function(Vector3))&dVector3ToFloatV);
    // returns float, Matrix param
    tcs["MatrixDeterminant"] =
    new TestCaseTM!float(cast(float function(Matrix))&MatrixDeterminant, cast(float function(Matrix))&dMatrixDeterminant);
    tcs["MatrixTrace"] =
    new TestCaseTM!float(cast(float function(Matrix))&MatrixTrace, cast(float function(Matrix))&dMatrixTrace);
    // returns Matrix, Matrix param
    tcs["MatrixTranspose"] =
    new TestCaseTM!Matrix(cast(Matrix function(Matrix))&MatrixTranspose, cast(Matrix function(Matrix))&dMatrixTranspose);
    tcs["MatrixInvert"] =
    new TestCaseTM!Matrix(cast(Matrix function(Matrix))&MatrixInvert, cast(Matrix function(Matrix))&dMatrixInvert);
    tcs["MatrixNormalize"] =
    new TestCaseTM!Matrix(cast(Matrix function(Matrix))&MatrixNormalize, cast(Matrix function(Matrix))&dMatrixNormalize);
    // returns Matrix, no param
    tcs["MatrixIdentity"] = 
    new TestCaseT!Matrix(cast(Matrix function())&MatrixIdentity, cast(Matrix function())&dMatrixIdentity);
    // END Function Test Cases
    
    foreach (key; tcs.keys.sort!((a, b) => a < b)) 
        "%s: %s".writefln(key, tcs[key].test);
} 
