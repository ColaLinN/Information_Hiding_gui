## 信息隐藏工具箱

目录：1.背景介绍2.工具箱使用说明3.文件结构图4.DCT域隐写

## 1.背景介绍

​		传统的信息隐藏起源于古老的隐写术。如在古希腊战争中，为了安全地传送军事情报，奴隶主剃光奴隶的头发，将情报纹在奴隶的头皮上，待头发长起后再派出去传送消息。我国古代也早有以藏头诗、藏尾诗、漏格诗以及绘画等形式，将要表达的意思和“密语”隐藏在诗文或画卷中的特定位置，一般人只注意诗或画的表面意境，而不会去注意或破解隐藏其中的密语。

​		信息隐藏的发展历史可以一直追溯到"匿形术（Steganography）"的使用。"匿形术"一词来源于古希腊文中"隐藏的"和"图形"两个词语的组合。虽然"匿形术"与密码术（Cryptography）"都是致力于信息的保密技术，但是，两者的设计思想却完全不同。"密码术"主要通过设计加密技术，使保密信息不可读，但是对于非授权者来讲，虽然他无法获知保密信息的具体内容，却能意识到保密信息的存在。而"匿形术"则致力于通过设计精妙的方法，使得非授权者根本无从得知保密信息的存在与否。相对于现代密码学来讲，信息隐藏的最大优势在于它并不限制对主信号的存取和访问，而是致力于签字信号的安全保密性。

​		经过十几年的研究和发展，信息隐藏技术不同的应用使它形成了不同的特点。但是，所有的信息隐藏系统共有一些基本的特点。作为利用数字通信技术来进行隐蔽信息通信的一种手段，信息隐藏技术具有的基本特点主要有以下几种:（1）不可感知性（2）鲁棒性（3）隐藏容量

​		随着数字隐藏技术的发展，在特定的应用方面对其技术性能又提出了更高、更具体的要求。在一般的信息隐藏方法中，这些特性都是相互冲突、互相矛盾的。例如，有的方法隐藏容量大，但鲁棒性较差；有的方法鲁棒性很好，但不可感知性较差；有的方法鲁棒性较差，但运算量较小，等等。应根据实际的需求对各种性能做出选择和择中，从而找到最合适的信息隐藏方法。

## 2.工具箱使用说明

##### A1隐写流程：

（1）在文本框中输入自己想隐写的信息

（2）选择载体图片

（3）写入一个用来生成伪随机数的key(种子)

（4）点击隐写信息
PS:在此过程中，会生成read.txt（隐写的信息），XXX_hide.bmp（嵌入信息图像）

##### A2提取流程：

选择隐写图片，XXX_hide.bmp，输入与隐写时相同的伪随机数的key、信息长度，就可以提取信息（也保存到extract.txt中）

##### B1水印隐写:

点击选择载体，输入生成水印的key，嵌入水印(此时水印被嵌入到Water_hide.png中)

##### B2水印检测:

选择原图，选择水印图Water_hide.png，输入与嵌入相同的key,就可以开始检测



## 3.文件结构图

### 1.如何打开

matlab命令行输入guide

![1575288266779](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575288266779.png)

打开现有GUI,找到fig

![1575288309303](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575288309303.png)

点击编译运行

![1575288494236](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575288494236.png)



### 2.界面介绍

#### 1.功能介绍

![1575290423131](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290423131.png)

#### 2.LSB随即位隐写

![1575290764998](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290764998.png)

#### 3.DCT隐写

![1575290788569](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290788569.png)

#### 4.W-SVD小波变换域水印

![1575290829443](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290829443.png)

#### 5.文件名介绍

1.从左到右，DCT算法，randLSB算法，W-SVD算法

![1575290601708](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290601708.png)

2.经典的lena

![1575290687553](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290687553.png)

3.LSB隐写生成图

![1575290858488](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290858488.png)

4.DCT隐写生成图

![1575290870512](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290870512.png)

5.W-SVD水印生成图

![1575290895287](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290895287.png)

6.隐写算法写入的信息，隐写算法提取的信息

![1575290706436](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290706436.png)

![1575290952794](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575290952794.png)

## 4.算法介绍

### 1.LSB随机位隐写

##### 主要思路

A.对图像矩阵进行遍历，并且在图像矩阵中取随机点，把每个点的像素的最低位LSB清零，替换为txt中字符串转化的bit流。

B.随机像素间隔的函数原理是，根据一个随机数种子生成随机数序列，并判断图像像素值是否为嵌入信息的2倍以上，若是则根据生成的随机数序列大小来选取每一row的不同间隔的col。

一般隐写之后结果如下，origin是原图，hide是隐写之后的图，由于是对像素点的LSB位进行改动，所以不会发生明显的变化，但是易受压缩等变换破坏。

<img src="C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575287279232.png" alt="1575287279232" style="zoom:67%;" />

```matlab
核心代码
for i=1:massage_length
	ste_cover(row(i),col(i)) = ste_cover(row(i),col(i))-mod(ste_cover(row(i),col(i)),2)+msg(p,1);%把最低位替换位信息位
end
```

### 2.DCT域隐写

##### 三点法嵌入和提取主要思路是

（1）对每个图片进行分块DCT，然后随机选取N个块进行操作，这里使用key调用randinterval函数（N暂定为10000以达到适应任意载体，N>写入的信息量)

（2）对嵌入信息进行遍历，当当前的图片块符合要求时，嵌入信息

——》这里的符合要求指（Beta是不可用块判定差值，A，B，C分别是(5,2)(4,3)(2,3)）

当A>C+Beta&&B>C+Beta时才嵌入消息1

当A<C-Beta&&B<C-Beta时才嵌入消息0

其他情况则把B与C交换，或者A与C交换达到C值在AB值中间的效果（即不可用块）

 ——》当不符合要求时，块数往前遍历，msg仍然不变，直到找到可用块

##### 核心伪代码如下

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml13364\wps1.jpg)

##### 实验

1当alpha为0.001时，图像变化不大，隐藏的信息无法抵抗JEPG压缩，隐藏的鲁棒性不好

2当alpha为0.01时，图像变化不大，隐藏的信息无法抵抗JEPG压缩，隐藏的鲁棒性不好

2当alpha为0.1时，图像变化不大，隐藏的信息可以抵抗JEPG压缩隐藏成功，此时图片无法看出明显的变化

3当alpha为3时，图片出现明显的噪声，但是信息保存的很好



### 3.W-SVD水印嵌入

**原理：**该算法属于小波变换域数字水印算法, 具有良好的水印不可见性和鲁棒性等特点。

假设要加入水印的图像为 M, 其归一化后的尺度 level 下的低频系数记为 （level 为小波分解的尺度）：

CA = wavetrans( M, level)

对 CA 作奇异值( 单值) 分解, 得到: 

CA = UΣVT

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps1.jpg) 

其中的数学原理为：对任意矩阵CA，都可以做奇异值（单值）分解CA=U*sigma*V’。

其中U、V是正交矩阵(U*U’=V*V’=I,I是单位阵)，sigma是对角矩阵（除主对角线外为0）。

 

**水印模板生成策略**：

   1.对图像做小波分解得到低频系数CA。

   2.对CA做单值分解 CA=U*sigma*V’

   3.用伪随机序列生成正交矩阵U、V ，对角矩阵sigma。

   4.用随机矩阵U、V的后d列替换U、V的后d列，得到新的U、V。

水印模板waterCA=U *sigma*V’

嵌入矩阵时需要按比例替换：

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps2.jpg) 

**以下放主要核心代码**

二位离散变换小波低频系数提取

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps3.jpg) 

 

随机正交矩阵的生成

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps4.jpg) 

 

**检测时的思路**：

W-SVD 算法采用非盲检测手段对图像进行检测。其思路为: 利用原始图像生成一个理论上存在的水印模板( 原始水印) , 从待测图像中提取可能存在的水印模板 (待测水印) , 继而计算两者的**相关性**。**当两者高度相关时,** 认定待测图像含有水印; 反之则检测不出水印。

###### 流程图如下

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps5.jpg) 

##### 检测有两种方式：

###### 1.常规检测：

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps6.jpg) 

###### 2.DCT域相关值检测：

![img](file:///C:\Users\HP\AppData\Local\Temp\ksohtml12596\wps7.jpg) 

#### 实验

##### 1.如下W-SVD插入水印成功

![1575288083816](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575288083816.png)

##### 2.

以下为W-SVD检测之后的结果，可以看到在常规检测下，用正确的key可以算出水印相关度很高

![1575288140675](C:\Users\HP\AppData\Roaming\Typora\typora-user-images\1575288140675.png)