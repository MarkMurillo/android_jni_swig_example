# Android JNI using SWIG Examples

This project demonstrates how to integrate [SWIG](http://www.swig.org/) (Simplified Wrapper and Interface Generator)
into the Android project. In this example, SWIG wraps native C code according to an interface file and generates the proxy classes needed to call native functions from Java/Kotlin.

### Advantages
- Generalizes (through interface files) writing wrapper code and takes care of a lot of boilerplate when it comes to working with JNI directly.

### Disadvantages
- Callbacks to Java still need to be hand written. If somebody else figures out how to write callbacks to Java using the interface files to modify the proxy classes, by all means do a pull request :) 

*(If interested in how to register callbacks to Java from Native C check out [Android JNI Examples](https://github.com/MarkMurillo/android_jni_example) which I also wrote!*



## Building the Project

In order to integrate SWIG with the gradle's build process, a custom task was used to call a shell script
called `jni-build.sh`. The script uses SWIG to generate the Java proxy classes used to interface with the C source code. 
The script is located at `app/src/main/java`

**NOTE: On first build of the project, the `jni-build.sh` script will generate a file `app/src/main/java/swig_tool_config.txt`
which requires the user to specify the location of where the SWIG executable is located. For example, if my SWIG tool is located in my local bin directory, the `swig_tool_config.txt` should contain one line: `/usr/local/bin/swig`**

## Unit Tests

Unit testing of the native methods is solely instrumented since loading of the native libraries without instrumentation requires additional configurations that, for the sake of brevity, isnt worth it.
