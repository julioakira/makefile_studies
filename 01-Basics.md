# Part 1 - The Basics

## So... what is a Makefile?
A Makefile is a file which contains rules for compiling, running and carrying out other utility tasks that involve a program, like cleaning up, recompiling and installing.
- As you might already know, it uses the `make` command to build from source by reading a target Makefile, which specifies which actions the computer should do to reach a particular goal.

## Why do I need a Makefile?
In compiled languages such as C or C++, as programs become larger and more complex, the dependency chain between files also becomes more complex. To apply changes you code across the project, these files need to be recompiled to reflect the most recent changes.
- When files in compiled languages change, they need to be recompiled in order for these changes to be applied. Among other functionalities, the goal of the Makefile is to compile and/or recompile whatever needs to be compiled. 

# Part 2 - Makefile Syntax

## Rule Syntax
As we mentioned before, a Makefile is a set of rules that the computer uses to handle a program. The rule syntax is specified as below:
```
target: prerequisites/dependencies
  recipe/command
```
- `targets` are file names, separated by spaces, typically one per rule.
- `recipe/command` are the steps used to achieve the target goal. **THEY NEED TO START WITH A TAB.**
- `prerequisites/dependencies` are also file names separated by spaces. They are the files that need to exist before you run the target command.
- For example, take the following rules:
```
file_2: file_1
	echo "This will run second, because it depends on the first rule"
	touch file_2

file_1:
	echo "This will run first"
	touch file_1
```
## Variables
Variables can only be strings, to create and reference variables, follow the same logic as bash:
```
FILES = file_1 file_2
OTHER_FILES = file_3 \
              file_4 \
              file_5 \

some_file: $(FILES)
	echo "Very files, much files, wow" $(FILES)
	touch some_file

file_1:
	touch file_1

file_2:
	touch file_2

clean:
	rm -f file_1 file_2 some_file
```
## Targets

## The `all` target
```
FILES = file1 file2 file3
all: $(FILES)

file1:
	touch file1
file2:
	touch file2
file3:
	touch file3
clean:
	rm -f $(FILES)
```

## Multiple targets
The `$@` is a variable that contains the target name
```
FILES = file1.o file2.o file3.o

file1.o file2.o file3.o:
	echo $@
```