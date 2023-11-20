## Вопросы на собеседовании фронтенд разработчика React.js

**JavaScript**:

<details>
<summary>Какие типы данных существуют в JavaScript?</summary>
<div>
  <ul>
    <li>
      Число <b>«number»</b> - Единый тип число используется как для целых, так и для дробных чисел. Существуют специальные числовые значения Infinity (бесконечность) и NaN (ошибка вычислений). Например, бесконечность Infinity получается при делении на ноль. Ошибка вычислений NaN будет результатом некорректной математической операции.
    </li>
    <li>
      Строка <b>«string»</b>
    </li>
    <li>
      Булевый (логический) тип <b>«boolean»</b>
    </li>
    <li>
      Специальное значение <b>«null»</b> - В JavaScript null не является «ссылкой на несуществующий объект» или «нулевым указателем», как в некоторых других языках. Это просто специальное значение, которое имеет смысл «ничего» или «значение неизвестно».
    </li>
    <li>
       Специальное значение <b>«undefined»</b> - Значение undefined, как и null, образует свой собственный тип, состоящий из одного этого значения. Оно имеет смысл «значение не присвоено». Если переменная объявлена, но в неё ничего не записано, то её значение как раз и есть undefined.
    </li>
    <li>
       Символы <b>«symbol»</b> - «Символ» представляет собой уникальный идентификатор. Создаются новые символы с помощью функции Symbol(). Символы гарантированно уникальны. Даже если мы создадим множество символов с одинаковым описанием, это всё равно будут разные символы. Описание – это просто метка, которая ни на что не влияет.
    </li>
     <li>
      Тип «number» не может содержать числа больше, чем (2<sup>53</sup>-1), или меньше, чем -(2<sup>53</sup>-1). Тип <b>«bigint»</b> даёт возможность работать с целыми числами произвольной длины.
    </li>
    <li>
      Объекты <b>«object»</b> - Первые 7 типов называют «примитивными». Особняком стоит восьмой тип: «объекты». Он используется для коллекций данных и для объявления более сложных сущностей. Объявляются объекты при помощи фигурных скобок {...}
    </li>
  </ul>
  <p><i>Источник: <a href ="https://learn.javascript.ru/types">learn.javascript.ru</a></i></p>
</div>
</details>

<details>
<summary>Что такое цикл событий (event loop) и как он работает?</summary>
<div>
  <p>Движок браузера выполняет JavaScript в одном потоке. Для потока выделяется область памяти — стэк, где хранятся фреймы (аргументы, локальные переменные) вызываемых функций.</p>
  <p>Список событий, подлежащих обработке формируют очередь событий. Когда стек освобождается, движок может обрабатывать событие из очереди. Координирование этого процесса и происходит в event loop.</p>
  <p>Это по сути бесконечный цикл, в котором выполняются многочисленные обработчики событий. Если очередь пустая — движок браузера ждет, когда поступит событие. Если непустая — первое в ней событие извлекается и его обработчик начинает выполняться. И так до бесконечности.</p>
   <img src="https://cdn-images-1.medium.com/max/1600/1*quyTIOs2hioCx1jRQ7-ojw.png" />
   <p><i>Источник: <a href ="https://medium.com/@pavelbely/javascript-event-loop-%D0%B2-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B0%D1%85-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-a19e4d99f242">Pavel Bely, medium.com</a></i></p>
</div>
</details>

<details>
<summary>Что такое замыкание?</summary>
<div>
  <p>Замыкание — это комбинация функции и лексического окружения, в котором эта функция была объявлена. Это окружение состоит из произвольного количества локальных переменных, которые были в области действия функции во время создания замыкания.</p>
  <p><i>Источник: <a href ="https://developer.mozilla.org/ru/docs/Web/JavaScript/Closures">developer.mozilla.org</a></i></p>
</div>
</details>

<details>
<summary>Что такое Promise (Промис)?</summary>
<div>
  <br/>
  <p>Promise – это специальный объект, который содержит своё состояние. Вначале pending («ожидание»), затем – одно из: fulfilled («выполнено успешно») или rejected («выполнено с ошибкой»).</p>
  <p>
    Синтаксис создания Promise:

    var promise = new Promise(function(resolve, reject) {
      // Эта функция будет вызвана автоматически

      // В ней можно делать любые асинхронные операции,
      // А когда они завершатся — нужно вызвать одно из:
      // resolve(результат) при успешном выполнении
      // reject(ошибка) при ошибке
    })
  </p>
  <p>
    Универсальный метод для навешивания обработчиков:

    promise.then(onFulfilled, onRejected)

  <ul>
    <li>onFulfilled – функция, которая будет вызвана с результатом при resolve.</li>
    <li>onRejected – функция, которая будет вызвана с ошибкой при reject.</li>
  </ul>
    Для того, чтобы поставить обработчик только на ошибку, вместо .then(null, onRejected) можно написать .catch(onRejected) – это то же самое.
  </p>
  <p>
    Возьмём setTimeout в качестве асинхронной операции, которая должна через некоторое время успешно завершиться с результатом «result»:

    // Создаётся объект promise
    let promise = new Promise((resolve, reject) => {

      setTimeout(() => {
        // переведёт промис в состояние fulfilled с результатом "result"
        resolve("result");
      }, 1000);

    });

    // promise.then навешивает обработчики на успешный результат или ошибку
    promise
      .then(
        result => {
          // первая функция-обработчик - запустится при вызове resolve
          alert("Fulfilled: " + result); // result - аргумент resolve
        },
        error => {
          // вторая функция - запустится при вызове reject
          alert("Rejected: " + error); // error - аргумент reject
        }
      );
В результате запуска кода выше – через 1 секунду выведется «Fulfilled: result».
  </p>
  <p><i>Источник: <a href ="https://learn.javascript.ru/promise">javascript.ru</a></i></p>
</div>
</details>

<br/>

**React**:

<details>
<summary>Какие методы жизненного цикла компонента существуют в React?</summary>
<div>
  <ul>
     <li>
       <b>render()</b> — единственный обязательный метод в классовом компоненте.
       <br>
       При вызове он проверяет this.props и this.state и возвращает один из следующих вариантов: Элемент React, Массивы и фрагменты, Порталы, Строки и числа, Booleans или null
     </li>
    <br/>
    <li>
      <b>constructor()</b> - Конструктор компонента React вызывается до того, как компонент будет примонтирован. В начале конструктора необходимо вызывать super(props). Если это не сделать, this.props не будет определён. Это может привести к багам.
      <br>
      Конструкторы в React обычно используют для двух целей: Инициализация внутреннего состояния через присвоение объекта this.state. Привязка обработчиков событий к экземпляру.
      <br>
      Конструктор — единственное место, где можно напрямую изменять this.state. В остальных методах необходимо использовать this.setState().
    </li>
    <br/>
    <li>
      <b>componentDidMount()</b> - вызывается сразу после монтирования (то есть, вставки компонента в DOM). В этом методе должны происходить действия, которые требуют наличия DOM-узлов. Это хорошее место для создания сетевых запросов.
      <br/>
      Этот метод подходит для настройки подписок. Но не забудьте отписаться от них в componentWillUnmount().
    </li>
    <br/>
    <li>
      <b>componentDidUpdate(prevProps, prevState, snapshot)</b> - вызывается сразу после обновления. Не вызывается при первом рендере. Метод позволяет работать с DOM при обновлении компонента. Также он подходит для выполнения таких сетевых запросов, которые выполняются на основании результата сравнения текущих пропсов с предыдущими. Если пропсы не изменились, новый запрос может и не требоваться.
    </li>
    <br/>
    <li>
      <b>componentWillUnmount()</b> - вызывается непосредственно перед размонтированием и удалением компонента. В этом методе выполняется необходимый сброс: отмена таймеров, сетевых запросов и подписок, созданных в componentDidMount().
    </li>
    <br/>
    <li>
      <b>shouldComponentUpdate(nextProps, nextState)</b> - вызывается перед рендером, когда получает новые пропсы или состояние. Значение по умолчанию равно true. Этот метод нужен только для повышения производительности.. Но не опирайтесь на его возможность «предотвратить» рендер, это может привести к багам. Вместо этого используйте PureComponent, который позволяет не описывать поведение shouldComponentUpdate() вручную. PureComponent поверхностно сравнивает пропсы и состояние и позволяет не пропустить необходимое обновление.
    </li>
    <br/>
    <li>
      <b>static getDerivedStateFromProps(props, state)</b> - вызывается непосредственно перед вызовом метода render, как при начальном монтировании, так и при последующих обновлениях. Он должен вернуть объект для обновления состояния или null, чтобы ничего не обновлять.
      <br/>
      Этот метод существует для редких случаев, когда состояние зависит от изменений в пропсах. 
    </li>
    <br/>
    <li>
      <b>getSnapshotBeforeUpdate(prevProps, prevState)</b> - вызывается прямо перед этапом «фиксирования» (например, перед добавлением в DOM). Он позволяет вашему компоненту брать некоторую информацию из DOM (например, положение прокрутки) перед её возможным изменением. Любое значение, возвращаемое этим методом жизненного цикла, будет передано как параметр componentDidUpdate().
    </li>
    <br/>
    <li>
      <b>static getDerivedStateFromError(error)</b> - Этот метод жизненного цикла вызывается после возникновения ошибки у компонента-потомка. Он получает ошибку в качестве параметра и возвращает значение для обновления состояния. getDerivedStateFromError() вызывается во время этапа «рендера». Поэтому здесь запрещены любые побочные эффекты, но их можно использовать в componentDidCatch().
    </li>
    <br/>
    <li>
      <b>componentDidCatch(error, info)</b> - Этот метод жизненного цикла вызывается после возникновения ошибки у компонента-потомка. Он получает два параметра: error — перехваченная ошибка, info — объект с ключом componentStack, содержащий информацию о компоненте, в котором произошла ошибка. Метод можно использовать для логирования ошибок.
    </li>
  </ul>
  <img src='https://cdn-images-1.medium.com/max/1600/1*cPwvUhZrnB1dtZnjBEfXfA.png' />
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/react-component.html#render">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Что такое Context в React и для чего он используется?</summary>
<div>
  <br />
  <p>Контекст разработан для передачи данных, которые можно назвать «глобальными» для всего дерева React-компонентов (например, текущий аутентифицированный пользователь, UI-тема или выбранный язык).</p>
  <p>Контекст позволяет избежать передачи пропсов в промежуточные компоненты: 

    // Контекст позволяет передавать значение глубоко
    // в дерево компонентов без явной передачи пропсов
    // на каждом уровне. Создадим контекст для текущей
    // UI-темы (со значением "light" по умолчанию).
    const ThemeContext = React.createContext('light');

    class App extends React.Component {
      render() {
        // Компонент Provider используется для передачи текущей
        // UI-темы вниз по дереву. Любой компонент может использовать
        // этот контекст и не важно, как глубоко он находится.
        // В этом примере мы передаём "dark" в качестве значения контекста.
        return (
          <ThemeContext.Provider value="dark">
            <Toolbar />
          </ThemeContext.Provider>
        );
      }
    }

    // Компонент, который находится в середине,
    // теперь не должен явно передавать UI-тему вниз.
    function Toolbar(props) {
      return (
        <div>
          <ThemedButton />
        </div>
      );
    }

    class ThemedButton extends React.Component {
      // Определяем contextType, чтобы получить значение контекста.
      // React найдёт (выше по дереву) ближайший Provider-компонент,
      // предоставляющий этот контекст, и использует его значение.
      // В этом примере значение UI-темы будет "dark".
      static contextType = ThemeContext;
      render() {
        return <Button theme={this.context} />;
      }
    }
  </p>
  <p>Обычно контекст используется, если необходимо обеспечить доступ данных во многих компонентах на разных уровнях вложенности. По возможности не используйте его, так как это усложняет переиспользование компонентов.</p>
  <ul>
    <b>API:</b>
    <li>
      <b>React.createContext</b> - оздание объекта Context. Когда React рендерит компонент, который подписан на этот объект, React получит текущее значение контекста из ближайшего подходящего Provider выше в дереве компонентов.
    </li>
    <li>
      <b>Context.Provider</b> - Каждый объект Контекста используется вместе с Provider компонентом, который позволяет дочерним компонентам, использующим этот контекст, подписаться на его изменения.
    </li>
    <li>
      <b>Class.contextType</b> - В свойство класса contextType может быть назначен объект контекста, созданный с помощью React.createContext(). Это позволяет вам использовать ближайшее и актуальное значение указанного контекста при помощи this.context. В этом случае вы получаете доступ к контексту, как во всех методах жизненного цикла, так и в рендер методе.
    </li>
    <li>
      <b>Context.Consumer</b> - Consumer — это React-компонент, который подписывается на изменения контекста. В свою очередь, это позволяет вам подписаться на контекст в функциональном компоненте. Consumer принимает функцию в качестве дочернего компонента. Эта функция принимает текущее значение контекста и возвращает React-компонент. Передаваемый аргумент value будет равен ближайшему (вверх по дереву) значению этого контекста, а именно пропу value Provider компонента. Если такого Provider компонента не существует, аргумент value будет равен значению defaultValue, которое было передано в createContext().
    </li>
  </ul>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/context.html">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Что такое Виртуальная DOM?</summary>
<div>
  <br />
  <p>
    Виртуальный DOM (VDOM) — это концепция программирования, в которой идеальное или «виртуальное» представление пользовательского интерфейса хранится в памяти и синхронизируется с «настоящим» DOM при помощи библиотеки, такой как ReactDOM. Этот процесс называется согласованием.
  </p>
  <p>
    Поскольку «виртуальный DOM» — это скорее паттерн, чем конкретная технология, этим термином иногда обозначают разные понятия. В мире React «виртуальный DOM» обычно ассоциируется с React-элементами , поскольку они являются объектами, представляющими пользовательский интерфейс. Тем не менее, React также использует внутренние объекты, называемые «волокнами» (fibers), чтобы хранить дополнительную информацию о дереве компонентов. Их также можно считать частью реализации «виртуального DOM» в React.
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/faq-internals.html">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Для чего нужен атрибут key при рендере списков?</summary>
<div>
  <br />
  <p>
    Ключи (keys) помогают React определять, какие элементы были изменены, добавлены или удалены. Их необходимо указывать, чтобы React мог сопоставлять элементы массива с течением времени.
  </p>
  <p>
    Лучший способ выбрать ключ — это использовать строку, которая будет явно отличать элемент списка от его соседей. Чаще всего вы будете использовать ID из ваших данных как ключи. Когда у вас нет заданных ID для списка, то в крайнем случае можно использовать индекс элемента как ключ.
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/lists-and-keys.html">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Как работает проп children?</summary>
<div>
  <br />
  <p>
    Некоторые компоненты не знают своих потомков заранее. Это особенно характерно для таких компонентов, как Sidebar или Dialog, которые представляют из себя как бы «коробку», в которую можно что-то положить. Для таких компонентов мы рекомендуем использовать специальный проп children, который передаст дочерние элементы сразу на вывод:

    function FancyBorder(props) {
      return (
        <div className={'FancyBorder FancyBorder-' + props.color}>
          {props.children}
        </div>
      );
    }
  </p>
  <p>
    Это позволит передать компоненту произвольные дочерние элементы, вложив их в JSX:

    function WelcomeDialog() {
      return (
        <FancyBorder color="blue">
          <h1 className="Dialog-title">
            Добро пожаловать
          </h1>
          <p className="Dialog-message">
            Спасибо, что посетили наш космический корабль!
          </p>
        </FancyBorder>
      );
    }
  </p>
  <p>
    Всё, что находится внутри JSX-тега <FancyBorder>, передаётся в компонент FancyBorder через проп children. Поскольку FancyBorder рендерит {props.children} внутри div, все переданные элементы отображаются в конечном выводе.
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/composition-vs-inheritance.html#containment">ru.reactjs.org</a></i></p>
</div>
</details>


<details>
<summary>В чем разница между управляемыми (controlled) и не управляемыми (uncontrolled) компонентами?</summary>
<div>
  <br />
  <p> В HTML элементы формы, такие как input, textarea и select, обычно сами управляют своим состоянием и обновляют его когда пользователь вводит данные. В React мутабельное состояние обычно содержится в свойстве компонентов state и обновляется только через вызов setState().
  </p>
  <p>
    В управляемом компоненте с каждой мутацией состояния связана функция-обработчик. Благодаря этому валидация или изменение введённого значения становится простой задачей. Например, если мы хотим, чтобы имя обязательно было набрано заглавными буквами, можно написать такой handleChange:

    handleChange(event) {
      this.setState({value: event.target.value.toUpperCase()});
    }
  </p>
  <p>
    Вместо того, чтобы писать обработчик события для каждого обновления состояния, вы можете использовать неуправляемый компонент и читать значения из DOM через реф.

    class NameForm extends React.Component {
      constructor(props) {
        super(props);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.input = React.createRef();
      }

      handleSubmit(event) {
        alert('Отправленное имя: ' + this.input.current.value);
        event.preventDefault();
      }

      render() {
        return (
          <form onSubmit={this.handleSubmit}>
            <label>
              Имя:
              <input type="text" ref={this.input} />
            </label>
            <input type="submit" value="Отправить" />
          </form>
        );
      }
    }
  </p>
  <p>
    Неуправляемые компоненты опираются на DOM в качестве источника данных и могут быть удобны при интеграции React с кодом, не связанным с React. Количество кода может уменьшиться, правда, за счёт потери в его чистоте. Поэтому в обычных ситуациях мы рекомендуем использовать управляемые компоненты.
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/forms.html#controlled-components">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Что такое PureComponent?</summary>
<div>
  <br />
  <p>
    React.PureComponent похож на React.Component. Отличие заключается в том, что React.Component не реализует shouldComponentUpdate(), а React.PureComponent реализует его поверхностным сравнением пропсов и состояния.
  </p>
  <p>
    Если метод render() вашего React-компонента всегда рендерит одинаковый результат при одних и тех же пропсах и состояниях, для повышения производительности в некоторых случаях вы можете использовать React.PureComponent.
  </p>
  <p>
    Метод shouldComponentUpdate() базового класса React.PureComponent делает только поверхностное сравнение объектов. Если они содержат сложные структуры данных, это может привести к неправильной работе для более глубоких различий (то есть, различий, не выраженных на поверхности структуры). Наследуйте класс PureComponent только тогда, когда вы ожидаете использовать простые пропсы и состояние
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/react-api.html#reactpurecomponent">ru.reactjs.org</a></i></p>
</div>
</details>


<details>
<summary>Что такое Компонент высшего порядка (Higher-Order Component, HOC)?</summary>
<div>
  <br />
  <p>
    Говоря просто, компонент высшего порядка — это функция, которая принимает компонент и возвращает новый компонент. HOC часто встречаются в сторонних библиотеках, например connect в Redux и createFragmentContainer в Relay.

    const EnhancedComponent = higherOrderComponent(WrappedComponent);
  </p>
  <p>
    Давайте реализуем функцию withSubscription — она будет создавать компоненты и подписывать их на обновления DataSource (наподобие CommentList и BlogPost). Функция будет принимать оборачиваемый компонент и через пропсы передавать ему новые данные:

    const CommentListWithSubscription = withSubscription(
      CommentList,
      (DataSource) => DataSource.getComments()
    );

    const BlogPostWithSubscription = withSubscription(
      BlogPost,
      (DataSource, props) => DataSource.getBlogPost(props.id)
    );
  </p>
  <p>
    Первый параметр — это оборачиваемый компонент. Второй — функция, которая извлекает нужные нам данные, она получает DataSource и текущие пропсы.
  </p>
  <p>
    Заметьте, что HOC ничего не меняет и не наследует поведение оборачиваемого компонента, вместо этого HOC оборачивает оригинальный компонент в контейнер посредством композиции. HOC является чистой функцией без побочных эффектов. Вот и всё! Оборачиваемый компонент получает все пропсы, переданные контейнеру, а также проп data. Для HOC не важно, как будут использоваться данные, а оборачиваемому компоненту не важно, откуда они берутся.
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/higher-order-components.html">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Что такое хуки в React?</summary>
<div>
  <br />
  <p>
    Хуки — нововведение в React 16.8, которое позволяет использовать состояние и другие возможности React без написания классов. Хуки — это функции, с помощью которых вы можете «подцепиться» к состоянию и методам жизненного цикла React из функциональных компонентов. Хуки не работают внутри классов — они дают вам возможность использовать React без классов. 
  </p>
  <p>
    Хук состояния - useState

      import React, { useState } from 'react';

      function Example() {
        // Объявляем новую переменную состояния "count"
        const [count, setCount] = useState(0);

        return (
          <div>
            <p>You clicked {count} times</p>
            <button onClick={() => setCount(count + 1)}>
              Нажми на меня
            </button>
          </div>
        );
      }

Вызов useState возвращает две вещи: текущее значение состояния и функцию для его обновления. Эту функцию можно использовать где угодно, например, в обработчике событий. Она схожа с this.setState в классах, но не сливает новое и старое состояние вместе. Единственный аргумент useState — это начальное состояние. В примере выше — это 0, так как наш счётчик начинается с нуля.
  </p>
  <p>
    Хук эффекта - useEffect

    import React, { useState, useEffect } from 'react';

    function Example() {
      const [count, setCount] = useState(0);

      // По принципу componentDidMount и componentDidUpdate:
      useEffect(() => {
        // Обновляем заголовок документа, используя API браузера
        document.title = `Вы нажали ${count} раз`;
      });

      return (
        <div>
          <p>Вы нажали {count} раз</p>
          <button onClick={() => setCount(count + 1)}>
            Нажми на меня
          </button>
        </div>
      );
    }

Когда вы вызываете useEffect, React получает указание запустить вашу функцию с «эффектом» после того, как он отправил изменения в DOM. Поскольку эффекты объявляются внутри компонента, у них есть доступ к его пропсам и состоянию. По умолчанию, React запускает эффекты после каждого рендера, включая первый рендер.
  </p>
  <p><i>Источник: <a href ="https://ru.reactjs.org/docs/hooks-overview.html">ru.reactjs.org</a></i></p>
</div>
</details>

<details>
<summary>Что такое React Reconciliation (Cверка) и как он работает?</summary>
<div>
  <br />
  <p>
    Reconciliation (Cверка) - это процесс, посредством которого React обновляет DOM. Когда состояние компонента изменяется, React должен рассчитать необходимость обновления DOM. Это делается путем создания виртуального DOM и сравнения его с текущим DOM. В этом контексте виртуальный DOM будет содержать новое состояние компонента.
  </p>
  <p>
    При сравнении двух деревьев первым делом React сравнивает два корневых элемента. Поведение различается в зависимости от типов корневых элементов. 
  </p>
  <p>
    Всякий раз, когда корневые элементы имеют различные типы, React уничтожает старое дерево и строит новое с нуля. 
  </p>
  <p>
    При сравнении двух React DOM-элементов одного типа, React смотрит на атрибуты обоих, сохраняет лежащий в основе этих элементов DOM-узел и обновляет только изменённые атрибуты.
  </p>
  <p>
    По умолчанию при рекурсивном обходе дочерних элементов DOM-узла React проходит по обоим спискам потомков одновременно и создаёт мутацию, когда находит отличие. Эта неэффективность может стать проблемой. Когда у дочерних элементов есть ключи, React использует их, чтобы сопоставить потомков исходного дерева с потомками последующего дерева.
  </p>
  <p><i>Источник: 
    <a href ="https://css-tricks.com/how-react-reconciliation-works/">css-tricks.com</a>,
    <a href ="https://ru.reactjs.org/docs/reconciliation.html">ru.reactjs.org</a>
  </i></p>
</div>
</details>

<br/>

**Flux-архитектура, Redux и MobX**:

<details>
  <summary>*** Что такое Flux - архитектура? Какие сущности она имеет?</summary>
  <div>
    <p>
      Flux-архитектура — архитектурный подход или набор шаблонов программирования для построения пользовательского интерфейса веб-приложений, сочетающийся с реактивным программированием и построенный на однонаправленных потоках данных.
    </p>
    <p>
      Основной отличительной особенностью Flux является односторонняя направленность передачи данных между компонентами Flux-архитектуры. Архитектура накладывает ограничения на поток данных, в частности, исключая возможность обновления состояния компонентов самими собой. Такой подход делает поток данных предсказуемым и позволяет легче проследить причины возможных ошибок в программном обеспечении.
    </p>
    <p>
      В минимальном варианте Flux-архитектура может содержать три слоя, взаимодействующие по порядку:
    </p>
    <ul>
      <li>
        <b>Действия</b> (англ. actions) — выражение событий (часто для действий используются просто имена — строки, содержащие некоторый «глагол»). Диспетчеры передают действия нижележащим компонентам (хранилищам) по одному. Новое действие не передаётся пока предыдущее полностью не обработано компонентами. Действия из-за работы источника действия, например, пользователя, поступают асинхронно, но их диспетчеризация явлется синхронным процессом. Кроме имени (англ. name), действия могут иметь полезную нагрузку (англ. payload), содержащую относящиеся к действию данные.
      </li>
      <li>
        <b>Диспетчер/Диспатчер</b> (англ. dispatcher) предназначен для передачи действий хранилищам. В упрощённом варианте диспетчер может вообще не выделяться, как единственный на всё приложение. В диспетчере хранилища регистрируют свои функции обратного вызова (callback) и зависимости между хранилищами.
      </li>
      <li>
        <b>Хранилище</b> (англ. store) является местом, где сосредоточено состояние (англ. state) приложения. Остальные компоненты, согласно Flux, не имеют значимого (с точки зрения архитектуры) состояния. Изменение состояния хранилища происходит строго на основе данных действия и старого состояния хранилища при помощи чистых функций.
      </li>
      <li>
        <b>Представление</b> (англ. view) — компонент, обычно отвечающий за выдачу информации пользователю. Во Flux-архитектуре, которая может технически не касаться внутреннего устройства представлений вообще, это — конечная точка потоков данных. Для информационной архитектуры важно только, что данные попадают в систему (то есть, обратно в хранилища) только через действия.
      </li>
    </ul>
    <p><i>Источник: <a href ="https://ru.wikipedia.org/wiki/Flux-%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0">wikipedia.org</a></i></p>
  </div>
</details>

<br/>

**Веб - технологии**:

<details>
  <summary>Что такое HTTP?</summary>
  <div>
    <p>
      Протокол передачи гипертекста (Hypertext Transfer Protocol - HTTP) - это прикладной протокол для передачи гипертекстовых документов, таких как HTML. Он создан для связи между веб-браузерами и веб-серверами, хотя в принципе HTTP может использоваться и для других целей. Протокол следует классической клиент-серверной модели, когда клиент открывает соединение для создания запроса, а затем ждет ответа. HTTP - это протокол без сохранения состояния, то есть сервер не сохраняет никаких данных (состояние) между двумя парами "запрос-ответ". Несмотря на то, что HTTP основан на TCP/IP, он также может использовать любой другой протокол транспортного уровня с гарантированной доставкой.
    </p>
    <p>
      Ниже перечислены общие функции, управляемые с HTTP:
    </p>
    <ul>
      <li>
        <b>Кэш.</b> Сервер может инструктировать прокси и клиенты: что и как долго кэшировать. Клиент может инструктировать прокси промежуточных кэшей игнорировать хранимые документы.
      </li>
      <li>
        <b>Ослабление ограничений источника.</b> Для предотвращения шпионских и других, нарушающих приватность, вторжений, веб-браузер обчеспечивает строгое разделеление между веб-сайтами. Только страницы из того же источника могут получить доступ к информации на веб-странице. Хотя такие ограничение нагружают сервер, заголовки HTTP могут ослабить строгое разделение на стороне сервера, позволяя документу стать частью информации с различных доменов (по причинам безопасности).
      </li>
      <li>
        <b>Аутентификация.</b> Некоторые страницы доступны только специальным пользователям. Базовая аутентификация может предоставляться через HTTP, либо через использование заголовка WWW-Authenticate и подобных ему, либо с помощью настройки спецсессии, используя куки.
      </li>
      <li>
        <b>Прокси и тунелирование.</b> Серверы и/или клиенты часто располагаются в интранете, и скрывают свои истинные IP-адреса от других. HTTP запросы идут через прокси для пересечения этого сетевого барьера. Не все прокси -- HTTP прокси. SOCKS-протокол, например, оперирует на более низком уровне. Другие, как, например, ftp, могут быть обработаны этими прокси.
      </li>
      <li>
        <b>Сессии.</b> Использование HTTP кук позволяет связать запрос с состоянием на сервере. Это создает сессию,  хотя ядро HTTP -- протокол без состояния.  Это полезно не только для корзин в интернет-магазинах, но также для любых сайтов, позволяющих пользователю настроить выход.
      </li>
    </ul>
    <p><i>Источник: <a href ="https://developer.mozilla.org/ru/docs/Web/HTTP/Overview">developer.mozilla.org</a></i></p>
  </div>
</details>

<details>
  <summary>Из чего состоит HTTP-запрос?</summary>
  <div>
    <img src='https://mdn.mozillademos.org/files/13687/HTTP_Request.png' />
    <p>
      Запросы содержат следующие элементы:
    </p>
    <ul>
      <li>
        HTTP-метод, обычно глагол подобно GET, POST или существительное, как OPTIONS или HEAD, определяющее операцию, которую клиент хочет выполнить. Обычно, клиент хочет получить ресурс (используя GET) или передать значения HTML-формы (используя POST), хотя другие операция могут быть необходимы в других случаях.
      </li>
      <li>
        Путь к ресурсу: URL ресурсы лишены элементов, которые очевидны из контекста, например без protocol (http://), domain (здесь developer.mozilla.org), или TCP port (здесь 80).
      </li>
      <li>
        Версию HTTP-протокола.
      </li>
      <li>
        Заголовки  (опционально), предоставляюшие дополнительную информацию для сервера.
      </li>
      <li>
        Или тело, для некоторых методов, таких как POST, которое содержит отправленный ресурс.
      </li>
    </ul>
    <p><i>Источник: <a href ="https://developer.mozilla.org/ru/docs/Web/HTTP/Overview">developer.mozilla.org</a></i></p>
  </div>
</details>

<details>
  <summary>Какие методы может иметь HTTP-запрос?</summary>
  <div>
    <p>
      HTTP определяет множество методов запроса, которые указывают, какое желаемое действие выполнится для данного ресурса. Несмотря на то, что их названия могут быть существительными, эти методы запроса иногда называются HTTP глаголами. Каждый реализует свою семантику, но каждая группа команд разделяет общие свойства: так, методы могут быть безопасными, идемпотентными или кэшируемыми.
    </p>
    <ul>
      <li>
        <b>GET</b> запрашивает представление ресурса. Запросы с использованием этого метода могут только извлекать данные.
      </li>
      <li>
        <b>HEAD</b> запрашивает ресурс так же, как и метод GET, но без тела ответа.
      </li>
      <li>
        <b>POST</b> используется для отправки сущностей к определённому ресурсу. Часто вызывает изменение состояния или какие-то побочные эффекты на сервере.
      </li>
      <li>
        <b>PUT</b> заменяет все текущие представления ресурса данными запроса.
      </li>
      <li>
        <b>DELETE</b> удаляет указанный ресурс.
      </li>
      <li>
        <b>CONNECT</b> устанавливает "туннель" к серверу, определённому по ресурсу.
      </li>
      <li>
        <b>OPTIONS</b> используется для описания параметров соединения с ресурсом.
      </li>
      <li>
        <b>TRACE</b> выполняет вызов возвращаемого тестового сообщения с ресурса.
      </li>
      <li>
        <b>PATCH</b> используется для частичного изменения ресурса.
      </li>
    </ul>
    <p><i>Источник: <a href ="https://developer.mozilla.org/ru/docs/Web/HTTP/Methods">developer.mozilla.org</a></i></p>
  </div>
</details>

<details>
  <summary>**Что такое Cross-Origin Resource Sharing (CORS)?</summary>
  <div>
    <p>
      Cross-Origin Resource Sharing (CORS) — механизм, использующий дополнительные HTTP-заголовки, чтобы дать возможность агенту пользователя получать разрешения на доступ к выбранным ресурсам с сервера на источнике (домене), отличном от того, что сайт использует в данный момент. Говорят, что агент пользователя делает запрос с другого источника (cross-origin HTTP request), если источник текущего документа отличается от запрашиваемого ресурса доменом, протоколом или портом.
    </p>
    <p>
      В целях безопасности браузеры ограничивают cross-origin запросы, инициируемые скриптами. Например, XMLHttpRequest и Fetch API следуют политике одного источника (same-origin policy). Это значит, что web-приложения, использующие такие API, могут запрашивать HTTP-ресурсы только с того домена, с которого были загружены, пока не будут использованы CORS-заголовки.
    </p>
    <p><i>Источник: <a href ="https://developer.mozilla.org/ru/docs/Web/HTTP/CORS">developer.mozilla.org</a></i></p>
  </div>
</details>

<details>
  <summary>**Что такое HTTP cookie и для чего их используют?</summary>
  <div>
    <p>
      HTTP cookie (web cookie, cookie браузера) - это небольшой фрагмент данных, отправляемый сервером на браузер пользователя, который тот может сохранить и отсылать обратно с новым запросом к данному серверу. Это, в частности, позволяет узнать, с одного ли браузера пришли оба запроса (например, для аутентификации пользователя). Они запоминают информацию о состоянии для протокола HTTP, который сам по себе этого делать не умеет.
    </p>
    <p>
      Cookie используются, главным образом, для:
    </p>
    <ul>
      <li>
        Управления сеансом (логины, корзины для виртуальных покупок)
      </li>
      <li>
        Персонализации (пользовательские предпочтения)
      </li>
      <li>
        Мониторинга (отслеживания поведения пользователя)
      </li>
    </ul>
    <p>
      Получив HTTP-запрос, вместе с откликом сервер может отправить заголовок  Set-Cookie с ответом. Cookie обычно запоминаются браузером и посылаются в значении заголовка HTTP  Cookie с каждым новым запросом к одному и тому же серверу. Можно задать срок действия cookie, а также срок его жизни, после которого cookie не будет отправляться. Также можно указать  ограничения на путь и домен, то есть указать, в течении какого времени и к какому сайту  оно отсылается.
    </p>
    <p>
      Куки можно создавать через JavaScript при помощи свойства Document.cookie. Если флаг HttpOnly не установлен, то и доступ к существующим cookies можно получить через JavaScript.
    </p>

      document.cookie = "yummy_cookie=choco"; 
      document.cookie = "tasty_cookie=strawberry";
   <p><i>Источник: <a href="https://developer.mozilla.org/ru/docs/Web/HTTP/%D0%9A%D1%83%D0%BA%D0%B8">developer.mozilla.org</a></i></p>
  </div>
</details>

<details>
  <summary>Что такое Babel и для чего он используется?</summary>
  <div>
    <br/>
    <p>
      Babel.JS – это транспайлер, переписывающий код на ES-2015 в код на предыдущем стандарте ES5.
    </p>
    <p>
      Обычно Babel.JS работает на сервере в составе системы сборки JS-кода (например webpack или brunch) и автоматически переписывает весь код в ES5.
    </p>
    <p>
      Настройка такой конвертации тривиальна, единственно – нужно поднять саму систему сборки, а добавить к ней Babel легко, плагины есть к любой из них.
    </p>
    <p>
      Конфигурация Babel прописывается в файле babel.config.js, либо в .babelrc для настроек одного пакета, а также в package.json или .babelrc.js
    </p>
    <p>
    Пример конфига в babel.config.js:

      module.exports = function (api) {
        api.cache(true);

        const presets = [ ... ];
        const plugins = [ ... ];

        return {
          presets,
          plugins
        };
      }
   </p>
    <p>
     <i>
       Источник: 
        <a href="https://learn.javascript.ru/es-modern-usage#babel-js">learn.javascript.ru</a>, 
        <a href="https://babeljs.io/docs/en/next/configuration">babeljs.io</a>
     </i>
    </p>
  </div>
</details>

--------------------
Кастомные хуки
- тоже самое что и реакт компонент, только он не возвращает JSX. В нем часто используются базовые хуки

useMemo, useCallback - чем отличаются


Typescript - что такое, работала ли с Typescript

Next.js что такое

Vite / CRA что такое

что такое webpack

Решения для СSS какие знаешь
- CSS
- SASS/SCSS
- CSS-in-js
- CSS Modules
- React "inline" style prop
- Tailwind
- Библиотеки компонентов:
  - Material UI
  - AntD
  - Bootstrap
  - другие