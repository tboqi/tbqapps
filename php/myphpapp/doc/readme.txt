模板先提供smarty的，以后提供其他的，通过配置解决
smarty使用Smarty-3.1.12.tar.gz

module_name  小写字母开头，不能用_   
controllerName 小写字母开头，以_分割多个单词，
一个module里面只有一个controller
所有的文件名文件夹名都不能有_，如果很有必要这么做，可以嵌套文件夹，如a_b可以写为a/b

先检测classes里面是否存在文件，如果不存在到core里面找，这样很方便的可以把原来提供的class重写了

