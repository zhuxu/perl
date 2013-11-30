#!/usr/bin/perl env
# this is a program that convert F C

print "Enter a temperature (e.g., 32F, 100C): \n";
# 获取用户输入
chomp($input = <STDIN>);
if ($input =~ m/^([-+]?[0-9]+(?:\.[0-9]*)?)\s*([CF])$/i){
	# 如果运行到此， 则已经匹配，$1保存数值，$保存C或者F
	$InputNum = $1;		# 把数据保存到已命名的变量
	$type     = $2;		# ....保证程序的可读性
	if ($type =~ m/c/i){	# Is it "c" or "C"?
		# 输入的是摄氏温度,计算华氏温度
		$celsius = $InputNum;
		$fahrenheit = ($celsius * 9 / 5) + 32;
	}else{
		# 如果不是摄氏温度，必定是华氏温度，计算摄氏温度
		$fahrenheit = $InputNum;
		$$celsius = ($fahrenheit - 32) * 5 / 9;
	}
	# 现在两个值都有了，输出结果
	printf "%.2f C is %.2f F\n", $celsius, $fahrenheit;
}else{
	# 开始的表达式无法匹配，发出警告
	print "Expecting a number followed by \"C\" or \"F\",\n";
		print "so I don't understand \"$input\".\n";
}
