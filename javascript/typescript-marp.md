<!-- $size: 16:9 -->
# Typescript

---

### How to install Typescript
>TypeScript를 시작하기 전에 Node.js와 Npm을 설치해야 한다. 다음 [링크](https://docs.npmjs.com/getting-started/installing-node)를 통해 Node.js를 설치할 수 있다.

TypeScript를 설치하는 가장 쉬운 방법은 npm을 통해 설치하는 것이다. 다음 명령어를 통해 설치한다.
```shell
npm install -g typescript
```

설치가 완료되면, 아래와 같은 명령어를 입력 후 제대로 설치됐는지 확인한다.
```shell
tsc -v
```
----------------------
### Compiling to Javascript
TypeScript는 .ts 파일(또는 JSX를 위해 .tsx 확장자를 쓰기도 한다.)로 작성된다. 브라우저에서는 이 ts 파일을 직접 사용하지 못하기 때문에 아래의 방법을 활용해 Javascript로 변환(*Transpile or Compile?*)해야 한다.
- tsc 사용(typescript를 설치할 때 같이 설치된다.)
- Visual Studio 혹은 플러그인을 지원해주는 IDE 사용
- gulp 혹은 grunt 같은 task runner 사용

---

다음 커맨드는 ts 파일을 js 파일로 변환하는 명령어다. 이름이 같은 Javascript 파일이 있으면 덮어 쓴다.
```shell
tsc main.ts
tsc main.ts worker.ts //여러 파일 동시에 변환
tsc *.ts
```
tsconfig.json 파일로 여러 컴파일 옵션을 줄 수 있다. 관련 내용은 [공식 문서](http://www.typescriptlang.org/docs/handbook/tsconfig-json.html)에서 확인 가능하다.

----------------------
### Static Typing
- TypeScript의 가장 큰 특징은 정적 타이핑을 지원한다는 점이다. 
- 즉, 변수 타입을 선언할 수 있으며 기존의 Java나 C처럼 컴파일러가 변수 형이 제대로 선언되어 있는지 확인 가능하다. 
- 만약 타입 선언이 생략되면 코드에서 자동으로 유추한다.

---

- 다음 예제처럼 모든 변수나 함수 인자에 타입을 선언할 수 있다.
```typescript
var burger: string = 'hamburger',     // String 
    calories: number = 300,           // Numeric
    tasty: boolean = true;            // Boolean

// Alternatively, you can omit the type declaration:
// var burger = 'hamburger';

// The function expects a string and an integer.
// It doesn't return anything so the type of the function itself is void.

function speak(food: string, energy: number): void {
  console.log("Our " + food + " has " + energy + " calories.");
}

speak(burger, calories);
```
---

위 코드를 Javascript로 컴파일하면 아래와 같은 코드가 생성된다.
```javascript
// JavaScript code from the above TS example.

var burger = 'hamburger',
    calories = 300, 
    tasty = true; 

function speak(food, energy) {
    console.log("Our " + food + " has " + energy + " calories.");
}

speak(burger, calories);
```
---


만약 typescript에서 다음 코드처럼 오류가 있을 경우, tsc로 컴파일 시 error 메세지를 출력한다.
```typescript
// The given type is boolean, the provided value is a string.
var tasty: boolean = "I haven't tried it yet";
```

```shell
main.ts(1,5): error TS2322: Type 'string' is not assignable to type 'boolean'.
```

--- 

```typescript
function speak(food: string, energy: number): void{
  console.log("Our " + food + " has " + energy + " calories.");
}

// Arguments don't match the function parameters.
speak("tripple cheesburger", "a ton of");
```

```shell
main.ts(5,30): error TS2345: Argument of type 'string' is not assignable to parameter of type 'number'.
```
---

Typescript가 지원하는 type은 다음과 같다.
- boolean: true or false, 0이나 1을 사용하면 컴파일 에러
- number: int와 float를 구분하지 않는다.
- string: single quotes ‘ ‘ 와 double quotes “”를 구분하지 않는다.
- array: 배열
- tuple: array완 달리 다른 타입을 한 tuple에 선언할 수 있다.
```typescript
// Declare a tuple type
let x: [string, number];
// Initialize it
x = ["hello", 10]; // OK
// Initialize it incorrectly
x = [10, "hello"]; // Error
```
---

- enum : C와 같은 enum 타입
- any: 말그대로 anything. 변수 타입이 변할 수 있다
```typescript
let notSure: any = 4;
notSure = "maybe a string instead";
notSure = false; // okay, definitely a Boolean
```

- void : 함수에서 아무것도 리턴하지 않을 때 사용된다.
- null and undefined: typescript에서 undefined와 null 각기 다른 타입이다.
```typescript
// Not much else we can assign to these variables!
let u: undefined = undefined;
let n: null = null;
```
---

### Interfaces
- 인터페이스는 주로 타입 검사를 위해서 활용된다. 
- 인터페이스는 변수 조합의 이름을 정의하여, 이렇게 정의된 변수의 조합은 항상 함께 사용된다. 
	> 참고로 자바스크립트로 변환하면 인터페이스는 사라진다. 
	> 인터페이스는 개발 단계에서 주로 사용되는 것이 목적이다.

---
다음 코드는 함수 인자의 타입을 체크하기 위한 간단한 인터페이스이다.

```typescript
// Here we define our Food interface, its properties, and their types.
interface Food {
    name: string;
    calories: number;
}

// We tell our function to expect an object that fulfills the Food interface. 
// This way we know that the properties we need will always be available.
function speak(food: Food): void{
  console.log("Our " + food.name + " has " + food.calories + " calories.");
}

// We define an object that has all of the properties the Food interface expects.
// Notice that types will be inferred automatically.
var ice_cream = {
  name: "ice cream", 
  calories: 200
}

speak(ice_cream);
```
---

- 위 코드에서 프로퍼티의 순서는 중요하지 않다. 
- 단지 해당 프로퍼티가 있는지, 그리고 타입이 맞는지 체크하는 것에 초점을 맞춘다. 
- 만약 아래코드처럼 타입이 다르다면(프로퍼티가 없거나 혹은 프로퍼티 네임이 다르다면) 컴파일러에서 에러가 날 것이다.

---
```typescript
interface Food {
    name: string;
    calories: number;
}

function speak(food: Food): void{
  console.log("Our " + food.name + " has " + food.calories + " grams.");
}

// We've made a deliberate mistake and name is misspelled as nmae.
var ice_cream = {
  nmae: "ice cream", 
  calories: 200
}

speak(ice_cream);
```

```shell
main.ts(16,7): error TS2345: Argument of type '{ nmae: string; calories: number; } 
is not assignable to parameter of type 'Food'. 
Property 'name' is missing in type '{ nmae: string; calories: number; }'.
```
---

- 하지만 인터페이스에서 모든 프로퍼티가 필요하지 않을 수 있다. 이 때, **Optional** 프로퍼티를 사용한다. 
- Optional 프로퍼티는 선택적으로 구현하는 프로퍼티를 정의할 때 사용한다. 프로퍼티 식별자 뒤에 **?** 를 붙인다.

```typescript
interface SquareConfig {
    color?: string;
    width?: number;
}

function createSquare(config: SquareConfig): { color: string; area: number } {
    let newSquare = {color: "white", area: 100};
    if (config.color) {
        // Error: Property 'color' does not exist on type 'SquareConfig'
        newSquare.color = config.color;
    }
    if (config.width) {
        newSquare.area = config.width * config.width;
    }
    return newSquare;
}

let mySquare = createSquare({color: "black"});
```

---

그리고 다음 코드 같이 Java나 C#의 Interface처럼 사용할 수 있다.

```typescript
interface ClockInterface {
    currentTime: Date;
    setTime(d: Date);
}

class Clock implements ClockInterface {
    currentTime: Date;
    setTime(d: Date) {
        this.currentTime = d;
    }
    constructor(h: number, m: number) { }
}
```

-------------------------------------------------

### Class
- TypeScript는 상속, 추상 클래스, 인터페이스 구현, setter / getter 등을 포함하여 C++, Java와 유사한 기능을 제공한다. 
- ES6에도 class 키워드를 제공하지만 typescript가 좀더 엄격한 면이 있다.

---

```typescript
class Animal {
    name: string;
    constructor(theName: string) { this.name = theName; }
    move(distanceInMeters: number = 0) {
        console.log(`${this.name} moved ${distanceInMeters}m.`);
    }
}

class Snake extends Animal {
    constructor(name: string) { super(name); }
    move(distanceInMeters = 5) {
        console.log("Slithering...");
        super.move(distanceInMeters);
    }
}

class Horse extends Animal {
    constructor(name: string) { super(name); }
    move(distanceInMeters = 45) {
        console.log("Galloping...");
        super.move(distanceInMeters);
    }
}
```

---

```typescript
let sam = new Snake("Sammy the Python");
let tom: Animal = new Horse("Tommy the Palomino");

sam.move();
tom.move(34);
```

```shell
Slithering...
Sammy the Python moved 5m.
Galloping...
Tommy the Palomino moved 34m.
```

- 위 코드처럼 typescript의 클래스는 상속을 지원하며,
  자식 클래스는 베이스 클래스의 생성자를 호출하기 위한 super() 함수를 사용한다.


---------------------------

### Generics
- Generics는 동일한 함수가 다양한 타입의 인자를 받을 수 있도록 해주는 템플릿이다. 
- Generics을 사용하면 인자로 들어오거나 return하는 변수 유형을 유지할수 있어서 any 타입을 사용하는 것보다 낫다. 

---

```typescript
// any type
function identityAny(arg: any): any {
    return arg;
}

// Generic
function identity<T>(arg: T): T {
    return arg;
}
let output = identity<string>("myString");  // type of output will be 'string'
let output2 = identity(123);  // type of output will be 'number'
```
- output 변수로 함수를 호출했을 때, 수동으로 타입을 string으로 명시했다.
- 컴파일러가 전달된 인자를 확인하기 때문에, output2 변수처럼 수동으로 타입을 명시하지 않아도 코드는 돌아간다.
- 하지만 코드가 복잡해지는 경우, 컴파일러가 제대로 타입을 추측하지 못할 수 있기 때문에 명시해주는 편이 좋다.
