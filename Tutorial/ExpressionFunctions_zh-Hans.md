# 内置函数

[引用](https://ncalc.github.io/ncalc/articles/functions.html?q=Function)

| 名称 | 描述 | 用法 | 结果 |
|------|------|------|------|
| Abs | 返回指定数字的绝对值。 | Abs(-1) | 1d |
| Acos | 返回余弦值为指定数字的角度。 | Acos(1) | 0d |
| Asin | 返回正弦值为指定数字的角度。 | Asin(0) | 0d |
| Atan | 返回正切值为指定数字的角度。 | Atan(0) | 0d |
| Ceiling | 返回大于或等于指定数字的最小整数。 | Ceiling(1.5) | 2d |
| Cos | 返回指定角度的余弦值。 | Cos(0) | 1d |
| Exp | 返回 e 的指定次幂。 | Exp(0) | 1d |
| Floor | 返回小于或等于指定数字的最大整数。 | Floor(1.5) | 1d |
| IEEERemainder | 返回指定数字相除的余数。 | IEEERemainder(3, 2) | -1d |
| Ln | 返回指定数字的自然对数。 | Ln(1) | 0d |
| Log | 返回指定数字的对数值。 | Log(1, 10) | 0d |
| Log10 | 返回指定数字的以 10 为底的对数。 | Log10(1) | 0d |
| Max | 返回两个指定数字中较大的一个。 | Max(1, 2) | 2 |
| Min | 返回两个数字中较小的一个。 | Min(1, 2) | 1 |
| Pow | 返回指定数字的指定次幂。 | Pow(3, 2) | 9d |
| Round | 将值四舍五入到最近的整数或指定的小数位数。在构造 Expression 对象时，可以通过 ExpressionOptions.RoundAwayFromZero 改变中间数字的行为。 | Round(3.222, 2) | 3.22d |
| Sign | 返回指示数字符号的值。 | Sign(-10) | -1 |
| Sin | 返回指定角度的正弦值。 | Sin(0) | 0d |
| Sqrt | 返回指定数字的平方根。 | Sqrt(4) | 2d |
| Tan | 返回指定角度的正切值。 | Tan(0) | 0d |
| Truncate | 计算数字的整数部分。 | Truncate(1.7) | 1 |

# 缓动函数

| 名称           | 描述                          |
|----------------|-------------------------------|
| Linear(x)      | 线性匀速运动                  |
| InSine(x)      | 缓入正弦曲线（先慢后快）      |
| OutSine(x)     | 缓出正弦曲线（先快后慢）      |
| InOutSine(x)   | 正弦曲线缓入缓出              |
| InQuad(x)      | 二次方缓入（逐渐加速）        |
| OutQuad(x)     | 二次方缓出（逐渐减速）        |
| InOutQuad(x)   | 二次方缓入缓出                |
| InCubic(x)     | 三次方缓入（更强加速）        |
| OutCubic(x)    | 三次方缓出（更强减速）        |
| InOutCubic(x)  | 三次方缓入缓出                |
| InQuart(x)     | 四次方缓入（极强加速）        |
| OutQuart(x)    | 四次方缓出（极强减速）        |
| InOutQuart(x)  | 四次方缓入缓出                |
| InQuint(x)     | 五次方缓入（超强加速）        |
| OutQuint(x)    | 五次方缓出（超强减速）        |
| InOutQuint(x)  | 五次方缓入缓出                |
| InExpo(x)      | 指数缓入（瞬间加速）          |
| OutExpo(x)     | 指数缓出（渐近减速）          |
| InOutExpo(x)   | 指数缓入缓出                  |
| InCirc(x)      | 圆形缓入（弧形加速）          |
| OutCirc(x)     | 圆形缓出（弧形减速）          |
| InOutCirc(x)   | 圆形缓入缓出                  |
| InElastic(x)   | 弹性缓入（带过冲反弹）        |
| OutElastic(x)  | 弹性缓出（带过冲反弹）        |
| InOutElastic(x)| 弹性缓入缓出                  |
| InBack(x)      | 回拉缓入（轻微反向运动）      |
| OutBack(x)     | 回拉缓出（轻微超越终点）      |
| InOutBack(x)   | 回拉缓入缓出                  |
| InBounce(x)    | 弹跳缓入（模拟碰撞反弹）      |
| OutBounce(x)   | 弹跳缓出（模拟碰撞反弹）      |
| InOutBounce(x) | 弹跳缓入缓出                  |
| Flash(x)       | 瞬间闪动效果                  |
| InFlash(x)     | 缓入闪动（快速起始）          |
| OutFlash(x)    | 缓出闪动（快速结束）          |
| InOutFlash(x)  | 闪动缓入缓出                  |