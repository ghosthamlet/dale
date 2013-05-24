# Dale

## 2.5 stdlib

### Details

Module: stdlib  
File: stdlib  

### Description

Provides commonly-used macros and functions, including the core
control structures (`for`, `while` and `let`). All of the bindings
provided by this library are in the root namespace.















### Macros

#### `@:'`

Linkage: `extern`  
Parameters:  

  * `structp`: The struct pointer argument.  
  * `member`: The first member's name.  

Takes a struct pointer and one or more struct member names as its
arguments. Expands to repeated calls to `@:@` over the struct and the
member names. For example, if two members are provided, the expansion
is `(@:@ (@:@ structp member1) member2)`.


#### `and`

Linkage: `extern`  
Parameters:  

  * `condition`: The condition expression.  
  * `true-case`: The form to run when condition is true.  

Takes a condition expression and a form to execute when the condition
is true. If the condition is true, returns the result of evaluating
the form. If the condition is false, returns `false`. Since this is
implemented with `if`, it is necessary that the `true-case` either
terminate or return a boolean.


#### `or`

Linkage: `extern`  
Parameters:  

  * `condition`: The condition expression.  
  * `false-case`: The form to run when condition is false.  

Takes a condition expression and a form to execute when the condition
is false. If the condition is false, returns the result of evaluating
the form. If the condition is true, returns `true`. Since this is
implemented with `if`, it is necessary that the `false-case` either
terminate or return a boolean.


#### `while`

Linkage: `extern`  
Parameters:  

  * `condition`: The condition expression form.  

Takes a condition expression and an arbitrary number of other forms as
its arguments. Expands to a form that loops over the provided forms
for so long as the condition expression evaluates to `true`.


#### `incf`

Linkage: `extern`  
Parameters:  

  * `form`: The pointer variable to be incremented.  

Takes a pointer form as its single argument. Expands to a form that
increments the underlying value and returns true.


#### `decf`

Linkage: `extern`  
Parameters:  

  * `form`: The pointer variable to be decremented.  

Takes a pointer form as its single argument. Expands to a form that
decrements the underlying value and returns true.


#### `incv`

Linkage: `extern`  
Parameters:  

  * `form`: The variable to be incremented.  

Takes a variable form as its single argument. Expands to a form that
increments the underlying value and returns true.


#### `decv`

Linkage: `extern`  
Parameters:  

  * `form`: The variable to be decremented.  

Takes a variable form as its single argument. Expands to a form that
decrements the underlying value and returns true.


#### `for`

Linkage: `extern`  
Parameters:  

  * `init-form`: The initialisation form.  
  * `condition`: The condition expression.  
  * `loop-entry`: The loop entry form.  

Takes an initialisation form, a condition expression, a loop entry
form and an arbitrary number of other forms as its arguments. Expands
into a 'for' loop: the initialisation form is run at the beginning,
the loop entry form is run on loop entry (except on the first
iteration), and the loop is only run for so long as the condition
expression evaluates to true.


#### `let`

Linkage: `extern`  
Parameters: `void`


A form for introducing local (automatic storage) variables. It's
easier to explain by example.

        (let (({name1} {type1} [{value1}])
              ({name2} {type2} [{value2}]))
          ; ...
          )

expands to:

        (new-scope
          (def {name1} (var auto {type1} {value1}))
          (def {name2} (var auto {type2} {value2}))
          ; ...
          )


#### `malloc'`

Linkage: `extern`  
Parameters:  

  * `n`: The number of objects being allocated.  
  * `T`: The type of the objects being allocated.  

Expands to a `malloc` that allocates memory sufficient for `n` `T`s.


#### `free'`

Linkage: `extern`  
Parameters:  

  * `form`: The pointer form.  

Expands to a `free` to which the pointer form argument, after being
cast to a void pointer, is passed.


#### `p<=`

Linkage: `extern`  
Parameters: `void`





#### `p>=`

Linkage: `extern`  
Parameters: `void`





#### `make-macro-constant`

Linkage: `extern`  
Parameters:  

  * `name`: The name of the macro constant.  
  * `value`: The value for the new macro constant.  

Expands to a macro definition, with the specified name, that in turn
expands to the value.


#### `long-type`

Linkage: `extern`  
Parameters: `void`


Expands to `sizeof(long)`. Only intended for use when writing C
bindings.


#### `ulong-type`

Linkage: `extern`  
Parameters: `void`


Expands to `sizeof(unsigned long)`. Only intended for use when writing
C bindings.


#### `long-long-type`

Linkage: `extern`  
Parameters: `void`


Expands to `sizeof(long long)`. Only intended for use when writing
C bindings.


#### `ulong-long-type`

Linkage: `extern`  
Parameters: `void`


Expands to `sizeof(unsigned long long)`. Only intended for use when
writing C bindings.


#### `mfor`

Linkage: `extern`  
Parameters: `void`


Short for 'macro for', but more akin to a 'foreach'. Takes a
value-name form, a value-list form and an arbitrary number of other
forms. For each entry in value-list, bind value-name to that value,
and expand the other forms, substituting any instance of value-name in
those forms with the value from value-list. For example:

        (mfor str ("asdf" "zxcv" "qwer")
          (printf "%s\n" str))

expands to:

        (printf "%s\n" "asdf")
        (printf "%s\n" "zxcv")
        (printf "%s\n" "qwer")


#### `no-op`

Linkage: `extern`  
Parameters: `void`


Expands to nothing.