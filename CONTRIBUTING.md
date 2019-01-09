# How to contribute

First of all, I would like to thank you for taking your time to help us develop this app. We are really glad you're here !.

This are son resources and knowledge you need to start:
  * [Ionic Documentation](https://ionicframework.com/getting-started)
  * [Angular Documentation](https://angular.io/guide/quickstart)
  * [Firebase Documentation](https://firebase.google.com/docs/)

## What to do

Search in our [Projects](https://github.com/stevencode5/RuthApp/projects) where we have some issues and features that you can solve. If you have an idea or a bug not reported yet, create an [Issue]((https://github.com/issues)) with the information required. Always follow the templates (Bug, Feature and Pull Request).


## Submitting changes

Please send a [GitHub Pull Request to RuthApp](https://github.com/stevencode5/RuthApp/pull/new/master), complete the default list with clear information of what you've done (read more about [pull requests](http://help.github.com/pull-requests/)). When you send a pull request, include examples and test of the issue o feature you solved. Please follow our coding conventions (below) and make sure all of your commits are atomic (one feature per commit).

Always write a clear log message for your commits. One-line messages are fine for small changes, but bigger changes should look like this:

    $ git commit -m "A brief summary of the commit
    > 
    > A paragraph describing what changed and its impact."

## Coding conventions

Start reading our code and you'll get the hang of it:

  * Every property class must be private
  * Every function should be private if not use in a page
  * Sort function arguments by relevance
  * We indent using two spaces (soft tabs)
  * We avoid logic in views, putting HTML generators into helpers
  * We ALWAYS put spaces after list items and method parameters (`[1, 2, 3]`, not `[1,2,3]`), around operators (`x += 1`, not `x+=1`), and around hash arrows.
  * This is open source software. Consider the people who will read your code, and make it look nice for them. It's sort of like driving a car: Perhaps you love doing donuts when you're alone, but with passengers the goal is to make the ride as smooth as possible.

### Names

1. Use PascalCase for type names.
2. Do not use "I" as a prefix for interface names.
3. Use ALL-UPPERCASE letters for enum values.
4. Use camelCase for function names.
5. Use camelCase for property names and local variables.
6. Do not use "_" as a prefix for private properties.
7. Use whole words in names and be descriptive when possible.

### Components 
1. 1 file per logical component, use de structure of Ionic for components and providers

### Types
1. Do not introduce new types/values.
2. Within a file, type definitions should come first.

### `null` and `undefined`
1. Use **undefined**. Do not use null.

### General Assumptions
1. Consider objects like Nodes, Symbols, etc. as immutable outside the component that created them. Do not change them.
2. Consider arrays as immutable by default after creation.
	
### Comments
1. Use JSDoc style comments for functions, interfaces, enums, and classes.

### Strings
1. Use double quotes for strings.
2. All strings visible to the user need to be internationalized.

### Style

1. Use arrow functions over anonymous function expressions.
2. Only surround arrow function parameters when necessary. <br />For example, `(x) => x + x` is wrong but the following are correct:
   1. `x => x + x`
   2. `(x,y) => x + y`
   3. `<T>(x: T, y: T) => x === y`
3. Always surround loop and conditional bodies with curly braces. Statements on the same line are allowed to omit braces.
4. Open curly braces always go on the same line as whatever necessitates them.
5. Parenthesized constructs should have no surrounding whitespace. <br />A single space follows commas, colons, and semicolons in those constructs. For example:
   1. `for (var i = 0, n = str.length; i < 10; i++) { }`
   2. `if (x < 10) { }`
   3. `function f(x: number, y: string): void { }`
6. Use a single declaration per variable statement <br />(i.e. use `var x = 1; var y = 2;` over `var x = 1, y = 2;`).
7. `else` goes on a separate line from the closing curly brace.
8. Use 4 spaces per indentation.


Thanks,
RuthApp's development group.
