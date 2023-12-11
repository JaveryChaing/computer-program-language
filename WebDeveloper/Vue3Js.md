## Vue3.JS

> - **模板语法**
>
>   1. 文本插值
>   2. html插值（v-html），存在XSS风险（永远不要使用用户提供的html内容）
>
>   3. 属性插值（:attribute)，如果值是是 `null` 或者 `undefined`， attribute 将会从渲染的元素上移除
>
>   - 动态参数`:[attributeName]='url'`
>
>   4. 绑定事件（@=“{...}”）
>
>      - <img src="./assets/image-20231210175634101.png" alt="image-20231210175634101" style="zoom:50%;" /> 
>
>         - submit：keyup，click
>        - modifiers：stop，prevent，capture，self，once，passive，left，middle，right，{keyAlias}
>
>   5. v-model：双向绑定
>
>        - lazy：输入框数据发生变化时进行同步
>
>        - trim/number
>
>   6. v-memo：同v-model，性能优化
>
>   7. v-slot/ #：插槽（标签内部占位），内容代替<slot> / # 标签出现的位置，与template标签配合使用
> - **响应式基础**
>
>   1. ref：定义实时渲染的基础类型变量
>
>      - 变量的改变与渲染不是实时的，需要使用 await nexTick()进行同步
>
>   2. reactive：同ref，监听对象所有属性的访问和修改触发渲染
>
>   3. toRef/toRefs：对响应式参数的引用（保持响应式特征）
>
>   4. shallowReactive/triggerRef：非递归响应
>
>   5. readonly/shallowReadonly/isReadonly：声明只读的响应式参数
>
>   6. isRef/isReactive/isProxy：isProxy判断变量是否为方法
>
>   7. toRaw/makeRaw：将响应式参数转为普通参数
> - **Vue特殊函数**
>   
>   1. computed：计算衍生值，定义函数返回计算后的变量（当原变量变动时进行计算）
>   2. watch：响应式变量状态发生变化时触发回调函数
>   3. watchEffect：同watch，响应式变量定义时回触发一次
>   4. **钩子函数**
>      - <img src="./assets/image-20231210203837478.png" alt="image-20231210203837478" style="zoom:67%;" /> 
>      - create：props，methods，watch，inject，provide等方法初始化后执行（通常定义初始化变量，API请求调用数据）
>      - mounted：用户页面DOM已渲染完成，this.$nextTick确保所有节点都渲染完成
>      - updated：DOM修改触发执行（data数据更改触发）
>      - activated/deactivated：与keep-alive使用，缓存当前页面状态
>      
>      
>   
> - **组件方法，参数传递**
>
>   1. props：父组件向子组件单向传递数据
>   2. $refs：父组件调用子组件方法
>   3. $emit：定义子组件事件，绑定父组件方法
>   4. $parent：子组件获取父组件DOM
>   5. `v-model:[props]` /  $emit('update:props',value)：父子组件数据双向绑定
>   6. eventBus/mitt：设置中央事件总线进行传递，在mounted中定义事件
>   7. provide/inject：传递响应式参数，函数
>   8. component： <component :is=''> </component> is变量绑定组件名称
>   9. keep-alive：保存组件状态标签
>   10. teleport：指定渲染组件的子节点（设置组件层级）
>   11. mixins：公共的逻辑（参数及函数），相同的参数将被覆盖，允许optionMergeStrategies设置优先级
>
> **Vuex**：组件数据共享
>
> - state：存储状态
> - getter：计算属性（state的衍生数据）
> - mutation / commit：修改状态
> - action / dispatch：修改状态（异步）
> - module：store分割模块
>
> **VueRouter：**路由管理
>
> - router-link/router-view：路由页
>
> - `watch '$router'(to,form)`：监听页面切换（根路径下进行页面切换监听）
>
> - beforeEach((to, from,next)=>{})：前置路由守卫（用于取消或重定向页面）
>
> - beforeResolve：用于获取数据或异常页面处理
>
> - beforeRouteEnter/Update/Leave：路由钩子函数
>
> - 嵌套路由/同级路由：嵌套路由必须到子路由才显示页面，同级路由需要存在多个router-view
>
>   

