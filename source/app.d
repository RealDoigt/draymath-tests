import raylib;
import raymath;
import draymath;
import std.stdio;
import test_cases;
import std.algorithm;

void main()
{
    // BEGIN Function Test Cases
    TestCase[string] tcs;

    // returns float, 3 float params
    tcs["Clamp"] = new TestCaseTFFF!float(&Clamp, &dClamp);
    tcs["Lerp"] = new TestCaseTFFF!float(&Lerp, &dLerp);
    tcs["Normalize"] = new TestCaseTFFF!float(&Normalize, &dNormalize);
    // returns float, 5 float params
    tcs["Remap"] = new TestCaseRemap(&Remap, &dRemap);
    // returns Vector2, no params
    tcs["Vector2Zero"] = new TestCaseT!Vector2(&Vector2Zero, &dVector2Zero);
    tcs["Vector2One"] = new TestCaseT!Vector2(&Vector2One, &dVector2One);
    // returns Vector2, 2 Vector2 params
    tcs["Vector2Add"] = new TestCaseTV2V2!Vector2(&Vector2Add, &dVector2Add);
    tcs["Vector2Subtract"] = new TestCaseTV2V2!Vector2(&Vector2Subtract, &dVector2Subtract);
    tcs["Vector2Multiply"] = new TestCaseTV2V2!Vector2(&Vector2Multiply, &dVector2Multiply);
    tcs["Vector2Divide"] = new TestCaseTV2V2!Vector2(&Vector2Divide, &dVector2Divide);
    tcs["Vector2Reflect"] = new TestCaseTV2V2!Vector2(&Vector2Reflect, &dVector2Reflect);
    // return float, 2 Vector2 params
    tcs["Vector2DotProduct"] = new TestCaseTV2V2!float(&Vector2DotProduct, &dVector2DotProduct);
    tcs["Vector2Distance"] = new TestCaseTV2V2!float(&Vector2Distance, &dVector2Distance);
    tcs["Vector2Angle"] = new TestCaseTV2V2!float(&Vector2Angle, &dVector2Angle);
    // returns Vector2, Vector2 and float params
    tcs["Vector2AddValue"] = new TestCaseV2V2F(&Vector2AddValue, &dVector2AddValue);
    tcs["Vector2SubtractValue"] = new TestCaseV2V2F(&Vector2SubtractValue, &dVector2SubtractValue);
    tcs["Vector2Scale"] = new TestCaseV2V2F(&Vector2Scale, &dVector2Scale);
    tcs["Vector2Rotate"] = new TestCaseV2V2F(&Vector2Rotate, &dVector2Rotate);
    // returns float, Vector2 param
    tcs["Vector2Length"] = new TestCaseTV2!float(&Vector2Length, &dVector2Length);
    tcs["Vector2LengthSqr"] = new TestCaseTV2!float(&Vector2LengthSqr, &dVector2LengthSqr);
    // returns Vector2, Vector2 param
    tcs["Vector2Negate"] = new TestCaseTV2!Vector2(&Vector2Negate, &dVector2Negate);
    tcs["Vector2Normalize"] = new TestCaseTV2!Vector2(&Vector2Normalize, &dVector2Normalize);
    // returns Vector2, 2 Vector2 and 1 float params
    tcs["Vector2Lerp"] = new TestCaseV2V2V2F(&Vector2Lerp, &dVector2Lerp);
    tcs["Vector2MoveTowards"] = new TestCaseV2V2V2F(&Vector2MoveTowards, &dVector2MoveTowards);
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
    // returns Matrix, 2 Matrix params
    tcs["MatrixAdd"] =
    new TestCaseMMM(cast(Matrix function(Matrix, Matrix))&MatrixAdd, cast(Matrix function(Matrix, Matrix))&dMatrixAdd);
    tcs["MatrixSubtract"] =
    new TestCaseMMM(cast(Matrix function(Matrix, Matrix))&MatrixSubtract, cast(Matrix function(Matrix, Matrix))&dMatrixSubtract);
    tcs["MatrixMultiply"] =
    new TestCaseMMM(cast(Matrix function(Matrix, Matrix))&MatrixMultiply, cast(Matrix function(Matrix, Matrix))&dMatrixMultiply);
    // returns Matrix, 3 float params
    tcs["MatrixTranslate"] =
    new TestCaseTFFF!Matrix(cast(Matrix function(float, float, float))&MatrixTranslate, cast(Matrix function(float, float, float))&dMatrixTranslate);
    tcs["MatrixScale"] =
    new TestCaseTFFF!Matrix(cast(Matrix function(float, float, float))&MatrixScale, cast(Matrix function(float, float, float))&dMatrixScale);
    // returns Matrix, Vector3 and float params
    tcs["MatrixRotate"] =
    new TestCaseMRotate(cast(Matrix function(Vector3, float))&MatrixRotate, cast(Matrix function(Vector3, float))&dMatrixRotate);
    // returns Matrix, float param
    tcs["MatrixRotateX"] =
    new TestCaseMF(cast(Matrix function(float))&MatrixRotateX, cast(Matrix function(float))&dMatrixRotateX);
    tcs["MatrixRotateY"] =
    new TestCaseMF(cast(Matrix function(float))&MatrixRotateY, cast(Matrix function(float))&dMatrixRotateY);
    tcs["MatrixRotateZ"] =
    new TestCaseMF(cast(Matrix function(float))&MatrixRotateZ, cast(Matrix function(float))&dMatrixRotateZ);
    // returns Matrix, Vector3 param
    tcs["MatrixRotateXYZ"] =
    new TestCaseTV3!Matrix(cast(Matrix function(Vector3))&MatrixRotateXYZ, cast(Matrix function(Vector3))&dMatrixRotateXYZ);
    tcs["MatrixRotateZYX"] =
    new TestCaseTV3!Matrix(cast(Matrix function(Vector3))&MatrixRotateZYX, cast(Matrix function(Vector3))&dMatrixRotateZYX);
    // returns Matrix, 6 Double params
    tcs["MatrixFrustum"] =
    new TestCaseMDDDDDD(cast(Matrix function(double, double, double, double, double, double))&MatrixFrustum, cast(Matrix function(double, double, double, double, double, double))&dMatrixFrustum);
    tcs["MatrixOrtho"] =
    new TestCaseMDDDDDD(cast(Matrix function(double, double, double, double, double, double))&MatrixOrtho, cast(Matrix function(double, double, double, double, double, double))&dMatrixOrtho);
    // returns Matrix, 4 Double params
    tcs["MatrixPerspective"] =
    new TestCaseMPerspective(cast(Matrix function(double, double, double, double))&MatrixPerspective, cast(Matrix function(double, double, double, double))&dMatrixPerspective);
    // returns float16, Matrix param
    tcs["MatrixToFloatV"] =
    new TestCaseMToFloatV(cast(float16 function(Matrix))&MatrixToFloatV, cast(float16 function(Matrix))&dMatrixToFloatV);
    // returns Vector4, 2 Vector4 params
    tcs["QuaternionAdd"] =
    new TestCaseTV4V4!Vector4(cast(Vector4 function(Vector4, Vector4))&QuaternionAdd, cast(Vector4 function(Vector4, Vector4))&dQuaternionAdd);
    tcs["QuaternionSubtract"] =
    new TestCaseTV4V4!Vector4(cast(Vector4 function(Vector4, Vector4))&QuaternionSubtract, cast(Vector4 function(Vector4, Vector4))&dQuaternionSubtract);
    tcs["QuaternionMultiply"] =
    new TestCaseTV4V4!Vector4(cast(Vector4 function(Vector4, Vector4))&QuaternionMultiply, cast(Vector4 function(Vector4, Vector4))&dQuaternionMultiply);
    tcs["QuaternionDivide"] =
    new TestCaseTV4V4!Vector4(cast(Vector4 function(Vector4, Vector4))&QuaternionDivide, cast(Vector4 function(Vector4, Vector4))&dQuaternionDivide);
    // returns Vector4, Vector4 and float params
    tcs["QuaternionAddValue"] =
    new TestCaseV4V4F(cast(Vector4 function(Vector4, float))&QuaternionAddValue, cast(Vector4 function(Vector4, float))&dQuaternionAddValue);
    tcs["QuaternionSubtractValue"] =
    new TestCaseV4V4F(cast(Vector4 function(Vector4, float))&QuaternionSubtractValue, cast(Vector4 function(Vector4, float))&dQuaternionSubtractValue);
    tcs["QuaternionScale"] =
    new TestCaseV4V4F(cast(Vector4 function(Vector4, float))&QuaternionScale, cast(Vector4 function(Vector4, float))&dQuaternionScale);
    // returns Vector4, no param
    tcs["QuaternionIdentity"] =
    new TestCaseT!Quaternion(cast(Quaternion function())&QuaternionIdentity, cast(Quaternion function())&dQuaternionIdentity);
    // returns float, Vector4 param
    tcs["QuaternionLength"] =
    new TestCaseTV4!float(cast(float function(Vector4))&QuaternionLength, cast(float function(Vector4))&dQuaternionLength);
    // returns Vector4, Vector4 param
    tcs["QuaternionNormalize"] =
    new TestCaseTV4!Vector4(cast(Vector4 function(Vector4))&QuaternionNormalize, cast(Vector4 function(Vector4))&dQuaternionNormalize);
    tcs["QuaternionInvert"] =
    new TestCaseTV4!Vector4(cast(Vector4 function(Vector4))&QuaternionInvert, cast(Vector4 function(Vector4))&dQuaternionInvert);
    // returns Vector4, 2 Vector4 and 1 float params
    tcs["QuaternionLerp"] =
    new TestCaseV4V4V4F(cast(Vector4 function(Vector4, Vector4, float))&QuaternionLerp, cast(Vector4 function(Vector4, Vector4, float))&dQuaternionLerp);
    tcs["QuaternionNlerp"] =
    new TestCaseV4V4V4F(cast(Vector4 function(Vector4, Vector4, float))&QuaternionNlerp, cast(Vector4 function(Vector4, Vector4, float))&dQuaternionNlerp);
    tcs["QuaternionSlerp"] =
    new TestCaseV4V4V4F(cast(Vector4 function(Vector4, Vector4, float))&QuaternionSlerp, cast(Vector4 function(Vector4, Vector4, float))&dQuaternionSlerp);
    // returns Vector4, 2 Vector3 params
    tcs["QuaternionFromVector3ToVector3"] =
    new TestCaseTV3V3!Vector4(cast(Vector4 function(Vector3, Vector3))&QuaternionFromVector3ToVector3, cast(Vector4 function(Vector3, Vector3))&dQuaternionFromVector3ToVector3);
    // returns Vector4, Matrix param
    tcs["QuaternionFromMatrix"] =
    new TestCaseTM!Vector4(cast(Vector4 function(Matrix))&QuaternionFromMatrix, cast(Vector4 function(Matrix))&dQuaternionFromMatrix);
    // returns Matrix, Vector4 param
    tcs["QuaternionToMatrix"] =
    new TestCaseTV4!Matrix(cast(Matrix function(Vector4))&QuaternionToMatrix, cast(Matrix function(Vector4))&dQuaternionToMatrix);
    // returns Vector4, Vector3 and float params
    tcs["QuaternionFromAxisAngle"] =
    new TestCaseV4FromAxisAngle(cast(Vector4 function(Vector3, float))&QuaternionFromAxisAngle, cast(Vector4 function(Vector3, float))&dQuaternionFromAxisAngle);
    // returns nothing; Vector4, Vector3 pointer and float pointer params
    tcs["QuaternionToAxisAngle"] =
    new TestCaseV4ToAxisAngle(cast(void function(Vector4, Vector3*, float*))&QuaternionToAxisAngle, cast(void function(Vector4, Vector3*, float*))&dQuaternionToAxisAngle);
    // returns Vector4, 3 float params
    tcs["QuaternionFromEuler"] =
    new TestCaseTFFF!Vector4(cast(Vector4 function(float, float, float))&QuaternionFromEuler, cast(Vector4 function(float, float, float))&dQuaternionFromEuler);
    // returns Vector3, Vector4 param
    tcs["QuaternionToEuler"] =
    new TestCaseTV4!Vector3(cast(Vector3 function(Vector4))&QuaternionToEuler, cast(Vector3 function(Vector4))&dQuaternionToEuler);
    // returns Vector4, Vector4 and Matrix params
    tcs["QuaternionTransform"] =
    new TestCaseV4Transform(cast(Vector4 function(Vector4, Matrix))&QuaternionTransform, cast(Vector4 function(Vector4, Matrix))&dQuaternionTransform);
    // END Function Test Cases

    foreach (key; tcs.keys.sort!((a, b) => a < b))
        "%s: %s".writefln(key, tcs[key].test);
}
