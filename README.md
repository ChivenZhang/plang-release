# plang-1.4.3

#### 软件介绍：
	a) Plang语言为支持面向对象的计算机编程语言;
	b) bin目录下的x64/plang.exe、 x86/plang32.exe是 Windows10 x64 平台下支持良好的Plang语言编译、解释程序;
	c) bin目录下的x64/pdb.exe、 x86/pdb32.exe是 Windows10 x64 平台下支持良好的Plang语言调试程序;

#### 设计目的
	a) 嵌入C/C++系统的脚本语言；
        b) 游戏脚本语言系统；

#### 语言特点
	a) 采用面向对象的程序设计思想；
	b) 支持继承、多态、抽象、封装；
	c) 支持本地方法调用（Plang Native Interface）；
	d) 支持协程语句（co_start/co_yield/co_await）；
	e) 语法借鉴C++、Java；
	f) 提供基本工具库，包含输入输出、集合、文件读写、XML解析、时间工具等

#### 语言语法
	参考《Plang用户文档》；

#### 使用方法
	a)
		1、将 bin/x64 或 bin/x86 目录添加到Path环境变量中；
		2、打开命令行（cmd.exe）；
		3、输入cd命令进入工作目录；
		4、输入plang/plang32 命令即可完成编译、执行、调试等操作；

	b) 双击run_??.bat文件即可运行测试类；


#### 参数说明
	a) plang [-s SourceFilePath] [-o OutputFilePath] [-i ImportClassPath] [-c MainClassName]

		-s：指定源文件编译目录；
		-o：指定编译输出目录，默认为 ./output；
		-i：指定外部类导入目录，默认为 ./library；
		-c：指定运行的 “static main()” 方法的所在类名；
		注：以上开关自由组合，每个开关仅携带单个参数；

	b) pdb [-s SourceFilePath] [-o OutputFilePath] [-i ImportClassPath] [-c MainClassName] [-d [yes|no]]

		-s：指定源文件编译目录；
		-o：指定编译输出目录，默认为 ./output；
		-i：指定外部类导入目录，默认为 ./library；
		-c：指定运行的 “static main()” 方法的所在类名；
		-d：指定是否开启调试模式，默认为 no；
		注：以上开关自由组合，每个开关仅携带单个参数；

		调试命令：
	    n(ext) -- debug next code;
	    i(n) -- jump into deeper context;
	    o(ut) -- jump out of current context;
	    g(o) [[Class:Method:]Line] -- jump to next break point;
	    b(reak) [Class:Method:]Line -- setup break point;
	    d(elete) [Class:Method:]Line -- delete break point;
	    c(lear) -- clear all break points;
	    s(et) Name:Scope:Value -- assign value to local variable;
	    p(rint) Name:Scope -- show value of local variable;
	    l(ist) Name:From:Num -- show table like break(point),code and local(variable);
	    t(race) -- show call stack;
	    q(uit)/e(xit) -- terminate debug process;

		调试命令说明：
		next：逐过程调试模式；
		in：逐语句调试模式；
		out：跳出调试模式；
		go：若不带参数，则运行至下一断点；否则运行至指定临时断点；例如：g basic/Test:main():10，跳转到序号为10的指令；
		break：设置非临时断点，其后指定中断位置；例如：b basic/Test:main():10；
		delete：删除存在的非临时断点，其后指定中断位置；格式参考break；
		clear：清楚所有非临时断点；
		set：局部变量赋值；例如：set num:2=333；
		print：打印局部变量；例如：p num:2；
		list：打印数据表，支持断点表(break)、指令表(code)、局部变量表(local)；例如：list break:0，打印前50个断点信息；
		trace：打印调用堆栈；
		quit/exit：退出调试；

#### 使用举例
	a) plang -s src -o output
	编译当前src目录所包含的所有源文件（.ps)，并将字节码文件（.p）导入 output 目录中；

	b) plang -o output -c basic/Test
	运行output目录下的basic::Test类中名为“main()->int”的公共静态方法。

	c) pdb -o output -c basic/Test -d yes
	调试output目录下的basic/Test类中名为“main()->int”的公共静态方法，程序将在首条指令处中断；

#### 注意事项
	a) 建议在Sublime text.exe中，使用GBK编码进行ps源文件编辑（防止中文乱码）；另外将ps文件的配色方案统一设置成Groovy，可改善用户编程体验；
	
	b) 调试程序pdb.exe是解释/执行程序plang.exe的功能超集，存在执行效率问题；

	c) pdb调试对象为字节码指令，非源代码语句；此设计考虑了：a）绝大部分指令为jvm指令，有一定推广度；b）降低开发难度；
