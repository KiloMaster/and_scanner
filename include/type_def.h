#ifndef type_def__h_
#define type_def__h_
#include "and_list.h"

//################### STRUCT ######################
#define FIELD_UNCERTAIN -1
//用于处理未定义的情况

#define FIELD_NONE 0
//没有字段

#define FIELD_IS_FUNC 1
#define FIELD_IS_VAR  2

#define TYPE_DECORATE_GLOBALE 0
#define TYPE_DECORATE_STATIC  1
#define TYPE_DECORATE_PRIVATE 2
#define TYPE_DECORATE_PUBLIC  3
#define TYPE_DECORATE_PROTECT 4    

//################### FUNCTION  ######################
#define TYPE_FUNC_CONSTRUCTER   5 
//构造器方法

#define TYPE_FUNC_DECONSTRUCTER 6
//析构器的方法

#define TYPE_FUNC_FILE_MAIN     7
//总的入口

#define TYPE_FUNC_STRUCT_MAIN   8
//结构体内部的main

#define VAR_TYPE_NOT_ARRAY 0
#define VAR_TYPE_ARRAY     1
#define VAR_TYPE_VARARRAY  -1

//#########################################
typedef struct typefield_item
{
    a_tag_t     tag;
    int32_t     typeNum;                //用于指示属于哪一个的类型的字段
    int32_t     fieldIndex;             //用于指示属于哪一个字段，的字段的编号
    char        fieldName[A_FIELD_NAME_LEN];              //用于指示属性的名字
} typefield_item_t; 

typedef struct  function_item
{
    a_tag_t     tag;
    int32_t     typeNum;                //用于指示属于哪一个类;
    char        funcName[A_FUNC_NAME_LEN];             
    int32_t     version;                //指明版本号
    int32_t     argc;                   //用于指明参数的个数
    int32_t     type;                   //用于指明函数类型 
    a_list_t    argv_list;              //用于存储函数的参数列表
    struct  function_item* a_over_ride; //同名的重载函数
    struct  function_item* next;        //用于形成下一个条目 
} function_item_t;

typedef struct typetb_item
{
    a_tag_t     tag;
    int32_t     typeNum;                //用于指示是哪一个类型‘类型编号
    char        typeName[A_TYPE_NAME_LEN];           //用于类型的名字
    int32_t     byteCount;              //类型的占用的字节的宽度
    int32_t     fieldCount;             //指示该类型共有多少的字段;没有字段则设置为-1;0
    struct      typetb_item* extends;   //用于指示继承了那个结构体的属性
    a_list_t    field_list;             //用于存储自身的属性的list      
    int32_t     isArray;                //0:VAR_TYPE_NOT_ARRAY; 1:VAR_TYPE_ARRAY;-1:VAR_TYPE_VARARRAY 
    int64_t     array_length;           //数组的分配的空间的长度,XXX:如果是-1,代表可变数组，长度不固定
    struct      typetb_item* next;      //用于指示下一个的条目。采用链表存储时才有用
} typetb_item_t;

typedef struct  inner_var
{
    a_tag_t     tag;                    //FIXME:此处的值，不是必须的;仅用于重用代码;
    int32_t     typeNum;                //存放的数据的类型
    int32_t     isArray;                //XXX:here's info alse can be get from type table,I also make 
                                        //it be here for less lookup type table 
    int64_t     array_length;           //已分配的空间
    int64_t     array_count;            //已经使用的空间
    uint8_t     space[];                  //变量的值的存放的空间
}inner_var_t; 


typedef struct  vartb_item
{
    a_tag_t      tag;
    char         varname[A_VAR_NAME_LEN];
    int64_t      reference_count;        //引用计数    
    inner_var_t* innerVar;
    vararray_type_t* refer;              //指向被引用的对象在变量表的位置
                                         //XXX: 如果一个变量表的条目的innerVar是空的话，则代表
                                         //此处的存放的变量是一个队其他的对象的引用      
} vararray_type_t;

typedef struct  exp
{
    a_tag_t     tag;
    int         op;
    struct exp* l;
    struct exp* r;     
}


#endif

