# SolveAssociationInputWithMaxLength
##这个问题源自于一个"倔(2)强(A?C)的测试".
###当我们使用UITextfield, UITextView时,一般产品都会给一个文本字数的限制,我们平时设置这个数字时,一般都会通过UITextfield, UITextView的代理判断当前文本框的字数,如果当前文本框的字数加上新增的文本字数大于限制的字数就return NO;
###那么问题来了,由联想输入法输入的内容不会走代理方法,所以只能走"另一条路",那就是监听UITextfield, UITextView的文本变化,这样就可以不管你输入多少,在文本长度改变的时候就把多余限制字数的文本裁减掉.这样应付测试就可以了,以了,了...
###代码还多了一个是否允许UITextfield, UITextView粘贴的属性,如果你们的产品有这方面的"怪癖",可以尝试一下.
