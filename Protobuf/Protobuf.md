## **Protobuf**

*跨语言通讯协议，数据存储，数据交换格式*

#### **基本数据类型转换** 

> |  .proto  |  C++   |    Java    |   Python    |   Go    |         Ruby         |     C#     |
> | :------: | :----: | :--------: | :---------: | :-----: | :------------------: | :--------: |
> |  double  | double |   double   |    float    | float64 |        Float         |   double   |
> |  float   | float  |   float    |    float    | float32 |        Float         |   float    |
> |  int32   | int32  |    int     |     int     |  int32  |   Fixnum or Bignum   |    int     |
> |  int64   | int64  |    long    |  ing/long   |  int64  |        Bignum        |    long    |
> |  uint32  | uint32 |    int     |  int/long   | uint32  |   Fixnum or Bignum   |    uint    |
> |  uint64  | uint64 |    long    |  int/long   | uint64  |        Bignum        |   ulong    |
> |  sint32  | int32  |    int     |     int     |  int32  |   Fixnum or Bignum   |    int     |
> |  sint64  | int64  |    long    |  int/long   |  int64  |        Bignum        |    long    |
> | fixed32  | uint32 |    int     |     int     | uint32  |   Fixnum or Bignum   |    uint    |
> | fixed64  | uint64 |    long    |  int/long   | uint64  |        Bignum        |   ulong    |
> | sfixed32 | int32  |    int     |     int     |  int32  |   Fixnum or Bignum   |    int     |
> | sfixed64 | int64  |    long    |  int/long   |  int64  |        Bignum        |    long    |
> |   bool   |  bool  |  boolean   |   boolean   |  bool   | TrueClass/FalseClass |    bool    |
> |  string  | string |   String   | str/unicode | string  |    String(UTF-8)     |   string   |
> |  bytes   | string | ByteString |     str     | []byte  |  String(ASCII-8BIT)  | ByteString |

#### **结构**

> ~~~protobuf
> // 导入其他proto文件
> import "" 
> // 导入any文件
> import "google/protobuf/any.proto";
> 
> // Packages
> option java_package= ""
> 
> 
> // 使用版本（默认proto2）
> syntax = "proto3";
> 
> // 多个数据格式可以在同一个文件
> // 数据格式 SearchRequest
> message SearchRequest {
> // 基本类型字段，常用字段编码排在前面（1~15）
> string query = 1;
> int32 page_number = 2;
> int32 result_per_page = 3;
> Corpus corpus = 4 ; // 默认是Corpus 的第一个值
> //Result 数组
> repeated Result results =5; 
> repeated google.protobuf.Any details = 6;
> 
> // Maps keyType 类型只有int、string ,映射字段不能重复
> map<string, Result> projects = 7
> 
> // 默认值，字段属性为可选字段。发送方可以选择性根据需要进行设置,没有设置默认值
> singular user=8
> 
> // 
> optional user_1=9
> }
> 
> message Result{
> string url = 1;
> string title = 2;
> // string 数组
> repeated string snippets = 3;
> }
> 
> 
> message Foo{
> // 数字标识和命名不能重复
> // 保留的字段或字段名(保留2,15 9~11 字段)
> reserved 2,15,9 to 11;
> reserved 'foo','bar';
> }
> 
> // 生成RPC接口及消息体
> service SearchService {
> rpc Search(SearchRequest) returns (SearchResponse);
> }
> 
> 
> // oneof 节约内存开销
> message SampleMessage{
> oneof test_oneof {
> string name = 1;
> }
> }
> 
> // 定义值的枚举
> enum Corpus{
> // 编码从0开始
> CORPUS_UNSPECIFIED = 0;
> CORPUS_UNIVERSAL = 1;
> CORPUS_WEB = 2;
> CORPUS_IMAGES = 3;
> CORPUS_LOCAL = 4;
> CORPUS_NEWS = 5;
> CORPUS_PRODUCTS = 6;
> CORPUS_VIDEO = 7;
> }
> ~~~

- #### **JSON与Protobuf转换**

  > | proto3                 | JSON          | JSON example                              |
  > | :--------------------- | :------------ | :---------------------------------------- |
  > | message                | object        | `{"fooBar": v, "g": null, …}`             |
  > | enum                   | string        | `"FOO_BAR"`                               |
  > | map<K,V>               | object        | `{"k": v, …}`                             |
  > | repeated V             | array         | `[v, …]`                                  |
  > | bool                   | true, false   | `true, false`                             |
  > | string                 | string        | `"Hello World!"`                          |
  > | bytes                  | base64 string | `"YWJjMTIzIT8kKiYoKSctPUB+"`              |
  > | int32, fixed32, uint32 | number        | `1, -10, 0`                               |
  > | int64, fixed64, uint64 | string        | `"1", "-10"`                              |
  > | float, double          | number        | `1.1, -10.0, 0, "NaN", "Infinity"`        |
  > | Any                    | `object`      | `{"@type": "url", "f": v, … }`            |
  > | Timestamp              | string        | `"1972-01-01T10:00:20.021Z"`              |
  > | Duration               | string        | `"1.000340012s", "1s"`                    |
  > | Struct                 | `object`      | `{ … }`                                   |
  > | Wrapper types          | various types | `2, "2", "foo", true, "true", null, 0, …` |
  > | FieldMask              | string        | `"f.fooBar,h"`                            |
  > | ListValue              | array         | `[foo, bar, …]`                           |
  > | Value                  | value         |                                           |
  > | NullValue              | null          |                                           |
  > | Empty                  | object        | `{}`                                      |