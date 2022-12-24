import raymath;
import draymath;
import test_cases;

void main()
{
    TestCase[string] tcs;
    
    tcs["clamp"] = new TestCaseFFFF(&raymath.Clamp, &draymath.Clamp);
    
    
} 
