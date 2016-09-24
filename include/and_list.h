#ifndef _and_list_h__
#define _and_list_h__
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "tag_def.h"
#include "config_limits.h"
#define TAG_I32                 1
#define TAG_I64                 2
#define TAG_I16                 3
#define TAG_I8                  4
#define TAG_FLOAT               5
#define TAG_DOUBLE              6
#define TAG_CHAR                7

#define TAG_U_I32               8
#define TAG_U_I64               9
#define TAG_U_I16               10
#define TAG_U_I8                11
#define TAG_U_FLOAT             12
#define TAG_U_DOUBLE            13
#define TAG_U_CHAR              14

#define TAG_PTR                 15
typedef  struct a_list a_list_t;   
typedef  int32_t a_tag_t;
typedef  struct a_node
{
    a_tag_t tag;
    union{
        int32_t             i32;
        int64_t             i64;
        int16_t             i16;
        int8_t              i8;
        float               f;
        double              d;
        char                c;

        uint32_t            u32;
        uint64_t            u64;
        uint16_t            u16;
        uint8_t             u8;
        unsigned  float     uf;
        unsigned  double    ud;
        unsigned  char      uc;

        void*   ptr_value;
    }v;         
} a_node_t;




#endif

