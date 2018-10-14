//
// Created by Mark Murillo on 2018-08-14.
//

#include "../includes/c_source_example.h"

void reverseBytesInPlace(unsigned char * inBytes, long inLen) {
    if(inBytes == NULL) return;
    if(inLen == 0) return;
    int i = 0;
    unsigned char temp = 0;

    for(i = 0; i < inLen/2; ++i) {
        temp = inBytes[i];
        inBytes[i] = inBytes[inLen - 1 - i];
        inBytes[inLen - 1 - i] = temp;
    }
}

unsigned char * reverseBytesCopy(unsigned char * inBytes, long inLen, long* outLen) {
    if(inBytes == NULL) return NULL;
    if(inLen == 0) return NULL;
    if(outLen == NULL) return NULL;
    int i = 0;

    unsigned char * result = (unsigned char *)calloc((size_t)inLen, sizeof(unsigned char));

    for(i = 0; i < inLen; ++i) {
        result[i] = inBytes[inLen - 1 - i];
    }

    outLen[0] = inLen;

    return result;
}
