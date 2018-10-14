package ca.murillo.swigexample

import android.support.test.InstrumentationRegistry
import android.support.test.runner.AndroidJUnit4
import ca.murillo.swigexample.jni.c_source_example

import org.junit.Test
import org.junit.runner.RunWith

import org.junit.Assert.*
import java.util.*

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {
    @Test
    fun useAppContext() {
        // Context of the app under test.
        val appContext = InstrumentationRegistry.getTargetContext()
        assertEquals("ca.murillo.swigexample", appContext.packageName)
    }


    @Test
    fun testReverseInPlace() {
        System.loadLibrary("native-lib")

        val oddLenByteArray = byteArrayOf(1, 2, 3, 4, 5)
        val evenLenByteArray = byteArrayOf(1, 2, 3, 4, 5, 6)

        val expectedOddOut = byteArrayOf(5, 4, 3, 2, 1)
        val expectedEvenOut = byteArrayOf(6, 5, 4, 3, 2, 1)

        c_source_example.reverseBytesInPlace(oddLenByteArray, oddLenByteArray.size)

        assert(Arrays.equals(oddLenByteArray, expectedOddOut))

        c_source_example.reverseBytesInPlace(evenLenByteArray, evenLenByteArray.size)

        assert(Arrays.equals(evenLenByteArray, expectedEvenOut))
    }

    @Test
    fun testReverseCopy() {
        System.loadLibrary("native-lib")

        val oddLenByteArray = byteArrayOf(1, 2, 3, 4, 5)
        val evenLenByteArray = byteArrayOf(1, 2, 3, 4, 5, 6)

        val expectedOddOut = byteArrayOf(5, 4, 3, 2, 1)
        val expectedEvenOut = byteArrayOf(6, 5, 4, 3, 2, 1)

        val outLen1 = longArrayOf(0)
        val result1 = c_source_example.reverseBytesCopy(oddLenByteArray, oddLenByteArray.size, outLen1)

        assert(Arrays.equals(result1, expectedOddOut))

        val outLen2 = longArrayOf(0)
        val result2 = c_source_example.reverseBytesCopy(evenLenByteArray, evenLenByteArray.size, outLen2)

        assert(Arrays.equals(result2, expectedEvenOut))
    }
}
