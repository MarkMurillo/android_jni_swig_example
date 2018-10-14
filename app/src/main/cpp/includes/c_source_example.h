//
// Created by Mark Murillo on 2018-08-14.
//

#ifndef C_SOURCE_EXAMPLE_H
#define C_SOURCE_EXAMPLE_H

//We must include jni.h to work with JNI!
#include <stdio.h>
#include <stdlib.h>
//Optional logging functionality to ADB
#include <android/log.h>
#define LOGV(TAG,...) __android_log_print(ANDROID_LOG_VERBOSE, TAG,__VA_ARGS__)
#define LOGD(TAG,...) __android_log_print(ANDROID_LOG_DEBUG  , TAG,__VA_ARGS__)
#define LOGI(TAG,...) __android_log_print(ANDROID_LOG_INFO   , TAG,__VA_ARGS__)
#define LOGW(TAG,...) __android_log_print(ANDROID_LOG_WARN   , TAG,__VA_ARGS__)
#define LOGE(TAG,...) __android_log_print(ANDROID_LOG_ERROR  , TAG,__VA_ARGS__)



void reverseBytesInPlace(unsigned char * inBytes, long inLen);
unsigned char * reverseBytesCopy(unsigned char * inBytes, long inLen, long* outLen);

#endif //C_SOURCE_EXAMPLE_H
