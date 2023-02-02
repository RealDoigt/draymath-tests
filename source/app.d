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
    tcs["Vector3Zero"] = new TestCaseT!Vector3(&Vector3Zero, &dVector3Zero);
    tcs["Vector3One"] = new TestCaseT!Vector3(&Vector3One, &dVector3One);
    // returns Vector3, 2 Vector3 params
    tcs["Vector3Add"] = new TestCaseTV3V3!Vector3(&Vector3Add, &dVector3Add);
    tcs["Vector3Subtract"] = new TestCaseTV3V3!Vector3(&Vector3Subtract, &dVector3Subtract);
    tcs["Vector3Multiply"] = new TestCaseTV3V3!Vector3(&Vector3Multiply, &dVector3Multiply);
    tcs["Vector3Divide"] = new TestCaseTV3V3!Vector3(&Vector3Divide, &dVector3Divide);
    tcs["Vector3Reflect"] = new TestCaseTV3V3!Vector3(&Vector3Reflect, &dVector3Reflect);
    tcs["Vector3CrossProduct"] = new TestCaseTV3V3!Vector3(&Vector3CrossProduct, &dVector3CrossProduct);
    tcs["Vector3Min"] = new TestCaseTV3V3!Vector3(&Vector3Min, &dVector3Min);
    tcs["Vector3Max"] = new TestCaseTV3V3!Vector3(&Vector3Max, &dVector3Max);
    // return float, 2 Vector3 params
    tcs["Vector3DotProduct"] = new TestCaseTV3V3!float(&Vector3DotProduct, &dVector3DotProduct);
    tcs["Vector3Distance"] = new TestCaseTV3V3!float(&Vector3Distance, &dVector3Distance);
    // return Vector2, 2 Vector3 params
    tcs["Vector3Angle"] = new TestCaseTV3V3!Vector2(&Vector3Angle, &dVector3Angle);
    // returns Vector3, Vector3 and float params
    tcs["Vector3AddValue"] = new TestCaseV3V3F(&Vector3AddValue, &dVector3AddValue);
    tcs["Vector3SubtractValue"] = new TestCaseV3V3F(&Vector3SubtractValue, &dVector3SubtractValue);
    tcs["Vector3Scale"] = new TestCaseV3V3F(&Vector3Scale, &dVector3Scale);
    // returns float, Vector3 param
    tcs["Vector3Length"] = new TestCaseTV3!float(&Vector3Length, &dVector3Length);
    tcs["Vector3LengthSqr"] = new TestCaseTV3!float(&Vector3LengthSqr, &dVector3LengthSqr);
    // returns Vector3, Vector3 param
    tcs["Vector3Perpendicular"] = new TestCaseTV3!Vector3(&Vector3Perpendicular, &dVector3Perpendicular);
    tcs["Vector3Negate"] = new TestCaseTV3!Vector3(&Vector3Negate, &dVector3Negate);
    tcs["Vector3Normalize"] = new TestCaseTV3!Vector3(&Vector3Normalize, &dVector3Normalize);
    // returns nothing, 2 Vector3 pointer params
    tcs["Vector3OrthoNormalize"] = new TestCaseOrthonormalize(&Vector3OrthoNormalize, &dVector3OrthoNormalize);
    // returns Vector3, Vector3 and Matrix params
    tcs["Vector3Transform"] = new TestCaseV3Transform(&Vector3Transform, &dVector3Transform);
    // returns Vector3, Vector3 and Vector4 params
    tcs["Vector3RotateByQuaternion"] = new TestCaseV3RotateByQuaternion(&Vector3RotateByQuaternion, &dVector3RotateByQuaternion);
    // returns Vector3, Vector3 and 2 Matrix params
    tcs["Vector3Unproject"] = new TestCaseV3Unproject(&Vector3Unproject, &dVector3Unproject);
    // returns float3, Vector3 param
    tcs["Vector3ToFloatV"] = new TestCaseF3V3(&Vector3ToFloatV, &dVector3ToFloatV);
    // returns float, Matrix param
    tcs["MatrixDeterminant"] = new TestCaseTM!float(&MatrixDeterminant, &dMatrixDeterminant);
    tcs["MatrixTrace"] = new TestCaseTM!float(&MatrixTrace, &dMatrixTrace);
    // returns Matrix, Matrix param
    tcs["MatrixTranspose"] = new TestCaseTM!Matrix(&MatrixTranspose, &dMatrixTranspose);
    tcs["MatrixInvert"] = new TestCaseTM!Matrix(&MatrixInvert, &dMatrixInvert);
    tcs["MatrixNormalize"] = new TestCaseTM!Matrix(&MatrixNormalize, &dMatrixNormalize);
    // returns Matrix, no param
    tcs["MatrixIdentity"] = new TestCaseT!Matrix(&MatrixIdentity, &dMatrixIdentity);
    // returns Matrix, 2 Matrix params
    tcs["MatrixAdd"] = new TestCaseMMM(&MatrixAdd, &dMatrixAdd);
    tcs["MatrixSubtract"] = new TestCaseMMM(&MatrixSubtract, &dMatrixSubtract);
    tcs["MatrixMultiply"] = new TestCaseMMM(&MatrixMultiply, &dMatrixMultiply);
    // returns Matrix, 3 float params
    tcs["MatrixTranslate"] = new TestCaseTFFF!Matrix(&MatrixTranslate, &dMatrixTranslate);
    tcs["MatrixScale"] = new TestCaseTFFF!Matrix(&MatrixScale, &dMatrixScale);
    // returns Matrix, Vector3 and float params
    tcs["MatrixRotate"] = new TestCaseMRotate(&MatrixRotate, &dMatrixRotate);
    // returns Matrix, float param
    tcs["MatrixRotateX"] = new TestCaseMF(&MatrixRotateX, &dMatrixRotateX);
    tcs["MatrixRotateY"] = new TestCaseMF(&MatrixRotateY, &dMatrixRotateY);
    tcs["MatrixRotateZ"] = new TestCaseMF(&MatrixRotateZ, &dMatrixRotateZ);
    // returns Matrix, Vector3 param
    tcs["MatrixRotateXYZ"] = new TestCaseTV3!Matrix(&MatrixRotateXYZ, &dMatrixRotateXYZ);
    tcs["MatrixRotateZYX"] = new TestCaseTV3!Matrix(&MatrixRotateZYX, &dMatrixRotateZYX);
    // returns Matrix, 6 Double params
    tcs["MatrixFrustum"] = new TestCaseMDDDDDD(&MatrixFrustum, &dMatrixFrustum);
    tcs["MatrixOrtho"] = new TestCaseMDDDDDD(&MatrixOrtho, &dMatrixOrtho);
    // returns Matrix, 4 Double params
    tcs["MatrixPerspective"] = new TestCaseMPerspective(&MatrixPerspective, &dMatrixPerspective);
    // returns float16, Matrix param
    tcs["MatrixToFloatV"] = new TestCaseMToFloatV(&MatrixToFloatV, &dMatrixToFloatV);
    // returns Vector4, 2 Vector4 params
    tcs["QuaternionAdd"] = new TestCaseTV4V4!Vector4(&QuaternionAdd, &dQuaternionAdd);
    tcs["QuaternionSubtract"] = new TestCaseTV4V4!Vector4(&QuaternionSubtract, &dQuaternionSubtract);
    tcs["QuaternionMultiply"] = new TestCaseTV4V4!Vector4(&QuaternionMultiply, &dQuaternionMultiply);
    tcs["QuaternionDivide"] = new TestCaseTV4V4!Vector4(&QuaternionDivide, &dQuaternionDivide);
    // returns Vector4, Vector4 and float params
    tcs["QuaternionAddValue"] = new TestCaseV4V4F(&QuaternionAddValue, &dQuaternionAddValue);
    tcs["QuaternionSubtractValue"] = new TestCaseV4V4F(&QuaternionSubtractValue, &dQuaternionSubtractValue);
    tcs["QuaternionScale"] = new TestCaseV4V4F(&QuaternionScale, &dQuaternionScale);
    // returns Vector4, no param
    tcs["QuaternionIdentity"] = new TestCaseT!Vector4(&QuaternionIdentity, &dQuaternionIdentity);
    // returns float, Vector4 param
    tcs["QuaternionLength"] = new TestCaseTV4!float(&QuaternionLength, &dQuaternionLength);
    // returns Vector4, Vector4 param
    tcs["QuaternionNormalize"] = new TestCaseTV4!Vector4(&QuaternionNormalize, &dQuaternionNormalize);
    tcs["QuaternionInvert"] = new TestCaseTV4!Vector4(&QuaternionInvert, &dQuaternionInvert);
    // returns Vector4, 2 Vector4 and 1 float params
    tcs["QuaternionLerp"] = new TestCaseV4V4V4F(&QuaternionLerp, &dQuaternionLerp);
    tcs["QuaternionNlerp"] = new TestCaseV4V4V4F(&QuaternionNlerp, &dQuaternionNlerp);
    tcs["QuaternionSlerp"] = new TestCaseV4V4V4F(&QuaternionSlerp, &dQuaternionSlerp);
    // returns Vector4, 2 Vector3 params
    tcs["QuaternionFromVector3ToVector3"] = new TestCaseTV3V3!Vector4(&QuaternionFromVector3ToVector3, &dQuaternionFromVector3ToVector3);
    // returns Vector4, Matrix param
    tcs["QuaternionFromMatrix"] = new TestCaseTM!Vector4(&QuaternionFromMatrix, &dQuaternionFromMatrix);
    // returns Matrix, Vector4 param
    tcs["QuaternionToMatrix"] = new TestCaseTV4!Matrix(&QuaternionToMatrix, &dQuaternionToMatrix);
    // returns Vector4, Vector3 and float params
    tcs["QuaternionFromAxisAngle"] = new TestCaseV4FromAxisAngle(&QuaternionFromAxisAngle, &dQuaternionFromAxisAngle);
    // returns nothing; Vector4, Vector3 pointer and float pointer params
    tcs["QuaternionToAxisAngle"] = new TestCaseV4ToAxisAngle(&QuaternionToAxisAngle, &dQuaternionToAxisAngle);
    // returns Vector4, 3 float params
    tcs["QuaternionFromEuler"] = new TestCaseTFFF!Vector4(&QuaternionFromEuler, &dQuaternionFromEuler);
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
