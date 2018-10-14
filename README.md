# Android JNI using SWIG Examples

This project demonstrates how to integrate SWIG (Simplified Wrapper and Interface Generator: http://www.swig.org/)
into the Android project. In this example, SWIG wraps native C code according to an interface file and generates the proxy classes needed to call native functions from Java/Kotlin.

## Building the Project

In order to integrate SWIG with the gradle's build process, a custom task was used to call a shell script
called `jni-build.sh`. The script uses SWIG to generate the Java proxy classes used to interface with the C source code. 
The script is located at `app/src/main/java`

**NOTE: On first build of the project, the `jni-build.sh` script will generate a file `app/src/main/java/swig_tool_config.txt`
which requires the user to specify the location of where the SWIG executable is located. For example, if my SWIG tool is located in my local bin directory, the `swig_tool_config.txt` should contain one line: `/usr/local/bin/swig`**

## Unit Tests

Unit testing of the native methods is solely instrumented since loading of the native libraries without instrumentation requires additional configurations that, for the sake of brevity, isnt worth it.
