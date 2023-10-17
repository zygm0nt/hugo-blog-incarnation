---
title: "useful CLI tools from other planet"
date: 2023-10-10T00:00:00Z
url: /2023/10/10/useful-cli-tools-from-other-planet
draft: false
comments: true
categories: 
    - it
    - tools
    - shell

---


I've already written a short post about me using `fzf` on this blog. And I still use it, it still is awesome! :)

But there are more tools like that. Maybe this is just my optics, but with the recent (at least 2 last years) `rust`'s rise to popularity, there are a lot of small tools doing a single task, or focusing on specific kind of problems. And they of course target terminals! Because it's obvious you can do many things on the web, but terminals are way cooler, and way more useful if you stick to them for the majority of your workflow.

I've mentioned `rust` and part of those apps is written in it, but it's not the only language used of course. There's `c++`, `c`, `go` and many more. What I find really interesting is to have those domain or task specific tools as self-contained as possible. Of course you can write all that in `python`, `php`, `java` - or you name it, what kind of language, but I'm here for the quality, speed, and ease of use - as I target those as my daily drivers for the terminal environment.

So, let's try to do a short summary of those tools!


## `fx` - terminal json viewer

https://github.com/antonmedv/fx 

Yep - you probably have `jq` already installed, as it's somewhat a go-to tool for JSON exploration, but what I like in `fx` is it's interactivity. It makes sifting through big JSON files pretty sweet! 
![Alt text](/post_images/useful_cli_tools_from_other_planet_01.png)
## `entr` - run arbitrary commands when file change
https://eradman.com/entrproject/ 

It does what it says - and just that. Seems awesome for all those small tasks, when you want to track changes in a dir structure!
There's a great section with examples on the project's page, but this one is just for an illustration. 

This snippet will rebuild project if files change.
```shell
$ ls | entr make
```


## `tig` - just a CLI based gitk replacement

 https://jonas.github.io/tig/ 

For all those times, when you'd like to have a view of your git repository in the terminal. Of course, you can get similar stuff with git aliases, like https://github.com/jakubnabrdalik/gitkurwa provided `git llog`. `tig` is for cases, when you want more, or you just don't want to setup your own, custom git env on remote host.

![Alt text](/post_images/useful_cli_tools_from_other_planet_02.png)

## `jc` - convert command-line tool output to json or dictionary

https://github.com/kellyjonbrazil/jc

This is actually a python library - but CLI related. You can use it both, as a python library, in other programs, or as a command-line tool.

It's useful if you want to interface with already established unix-based programs. Suppose there's already a decent CLI tool to do sth on Linux machine. You can either look for the reimplementation of its functionality in `python` - or you can try to use the original tool. But then how to use it's output in an elegant way? Well, that's where `jc` comes in.
It offers a bunch of parsers, to be used depending on the command executed. Full list is here: https://github.com/kellyjonbrazil/jc#parsers


 ```
 >>> import subprocess
>>> import jc
>>>
>>> cmd_output = subprocess.check_output(['dig', 'example.com'], text=True)
>>> data = jc.parse('dig', cmd_output)
>>>
>>> data[0]['answer']
[{'name': 'example.com.', 'class': 'IN', 'type': 'A', 'ttl': 29658, 'data':
'93.184.216.34'}]
```

## `xsv` - a fast csv parser

https://github.com/BurntSushi/xsv 

Rust-based csv parser. Blazingly fast, have a bunch of good enough features. Actually all it's analytical functions can be rather easily implemented in `python` using `pandas`. But would it fit everyone? Probably not, as you need to know both `python` and `pandas`, with all its finices.

Whereas here, you get an ordinary text parsing tool, that can help with a lot of basic 

```
$ xsv stats worldcitiespop.csv --everything | xsv table
field       type     min            max            min_length  max_length  mean          stddev         median     mode         cardinality
Country     Unicode  ad             zw             2           2                                                   cn           234
City        Unicode   bab el ahmar  Þykkvibaer     1           91                                                  san jose     2351892
AccentCity  Unicode   Bâb el Ahmar  ïn Bou Chella  1           91                                                  San Antonio  2375760
Region      Unicode  00             Z9             0           2                                        13         04           397
Population  Integer  7              31480498       0           8           47719.570634  302885.559204  10779                   28754
Latitude    Float    -54.933333     82.483333      1           12          27.188166     21.952614      32.497222  51.15        1038349
Longitude   Float    -179.983333    180            1           14          37.08886      63.223
```

## Other nice tools

* https://github.com/sxyazi/yazi - file manager
* https://github.com/BurntSushi/ripgrep - a grep alternative
* https://github.com/eza-community/eza (replacement for https://github.com/ogham/exa, which is now an abandoned project) - a modern ls replacement

![Alt text](/post_images/useful_cli_tools_from_other_planet_03.png)

* https://www.visidata.org/ - interactive tool for tabular data
![Alt text](/post_images/useful_cli_tools_from_other_planet_04.png)

## To conclude

There are a lot of great tools like those mentioned above. Some will fit you, some won't. It's nice to have a diverse set of tools in your tool belt, to be used in the time of need!
