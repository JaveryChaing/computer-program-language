## Reactor

- RxJava

  > *响应式编程，基于事件异步方式操作数据。*
  >
  > Observer(观察者)：监听事件
  >
  > Observavle(被观察者)：定义事件，
  >
  > RxJava事件
  >
  > - OnNext：发送数据
  > - OnError：发送错误
  > - OnComplete：发送完成

- Reactor (非阻塞响应式编程)

  > 同步/异步：调用则是否等待返回信息才能继续执行
  >
  > 阻塞/非阻塞：执行进程/线程被挂起，**等待某个事件完成后**再唤醒被挂起的任务
  >
  >  
  >
  >  IO请求模型
  >
  > - BIO(同步阻塞)：一个线程负责一个IO请求
  > - NIO(同步非阻塞)：一个线程轮询监听请求注册器，在存在IO请求时处理
  > - AIO(异步非阻塞)：回调函数
  >
  >  
  >
  > 响应式编程是一种基于数据流和变化传递的声明式的编程范式
  >
  >  
  >
  > | 序号 | 类型 | 操作符                                                       |
  > | ---- | ---- | ------------------------------------------------------------ |
  > | 1    | 转换 | as, cast, collect, collectList, collectMap, collectMultimap, collectSortedList, concatMap, concatMapDelayError, concatMapIterable, elapsed, expand, expandDeep, flatMap, flatMapDelayError, flatMapIterable, flatMapSequential, flatMapSequentialDelayError, groupJoin, handle, index, join, map, switchMap, switchOnFirst, then, thenEmpty, thenMany, timestamp, transform, transformDeferred |
  > | 2    | 筛选 | blockFirst, blockLast, distinct, distinctUntilChanged, elementAt, filter, filterWhen, ignoreElements, last, next, ofType, or, repeat, retry, single, singleOrEmpty, sort, take, takeLast, takeUntil, takeUntilOther, takeWhile |
  > | 3    | 组合 | concatWith, concatWithValues, mergeOrderWith, mergeWith, startWith, withLatestFrom, zipWith, zipWithIterable |
  > | 4    | 条件 | defaultIfEmpty, delayUntil, retryWhen, switchIfEmpty         |
  > | 5    | 时间 | delayElements, delaySequence, delaySubscription, sample, sampleFirst, sampleTimeout, skip, skipLast, skipUntil, skipUntilOther, skipWhile, timeout |
  > | 6    | 统计 | count, reduce, reduceWith, scan, scanWith                    |
  > | 7    | 匹配 | all, any, hasElement, hasElements                            |
  > | 8    | 分组 | buffer, bufferTimeout, bufferUntil, bufferUntilChanged, bufferWhen, groupBy, window, windowTimeout, windowUntil, windowUntilChanged, windowWhen, windowWhile |
  > | 9    | 事件 | doAfterTerminate, doFinally, doFirst, doOnCancel, doOnComplete, doOnDiscard, doOnEach, doOnError, doOnNext, doOnRequest, doOnSubscribe, doOnTerminate, onBackpressureBuffer, onBackpressureDrop, onBackpressureError, onBackpressureLatest, onErrorContinue, onErrorMap, onErrorResume, onErrorReturn, onErrorStop |
  > | 10   | 调试 | checkpoint, hide, log                                        |
  > | 11   | 其它 | cache, dematerialize, limitRate, limitRequest, materialize, metrics, name, onTerminateDetach, parallel, publish, publishNext, publishOn, replay, share, subscribeOn, subscriberContext, subscribeWith, tag |

