/*************************************************************************
 * c_source_example.i
 *
 * SWIG interface file that controls how the JNI is handled when wrapping
 * the C files.
 *
 ************************************************************************/

%module c_source_example

%{
/* Include the header in the wrapper code */
#include "../includes/c_source_example.h"
%}

/* ============================================DEFINES============================================ */
//This line makes sure that all native constants are accessed via function on the java side and
//not declared as inline java code.
%javaconst(0);


/* ============================================RULES============================================ */

/* Handle (unsigned char *) type conversions */
%typemap(jni) (unsigned char *) "jbyteArray"
%typemap(javain) (unsigned char *) "$javainput"
%typemap(jtype) (unsigned char *) "byte[]"
%typemap(jstype) (unsigned char *) "byte[]"
%typemap(javaout) (unsigned char *) {
    return $jnicall;
}

%typemap(in) unsigned char * () {
    if($input) {
        $1 = (unsigned char *) JCALL2(GetByteArrayElements, jenv, $input, 0);
    }
}

%typemap(freearg) unsigned char * () {
    if($1) {
        JCALL3(ReleaseByteArrayElements, jenv, $input, (jbyte *)$1, 0);
    }
}

%typemap(out) unsigned char * {
    if($1) {
        if(arg2 == 0 || arg3 == NULL) $result = 0;
        else {
            $result = JCALL1(NewByteArray, jenv, (jsize)arg3[0]);
            JCALL4(SetByteArrayRegion, jenv, $result, 0, (jsize)arg3[0], (jbyte*)$1);
            free($1);
        }
    }
}

/* Handle (long *) type conversions */
%typemap(jni) (long *) "jlongArray"
%typemap(javain) (long *) "$javainput"
%typemap(jtype) (long *) "long[]"
%typemap(jstype) (long *) "long[]"
%typemap(javaout) (long *) {
    return $jnicall;
}

%typemap(in) long * () {
    if($input) {
        $1 = (long *) JCALL2(GetLongArrayElements, jenv, $input, 0);
    }
}

%typemap(freearg) long * () {
    if($1) {
        JCALL3(ReleaseLongArrayElements, jenv, $input, (jlong *)$1, 0);
    }
}

/* ======================================FUNCTIONS/METHODS====================================== */

void reverseBytesInPlace(unsigned char * inBytes, long inLen);
unsigned char * reverseBytesCopy(unsigned char * inBytes, long inLen, long* outLen);


