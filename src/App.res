%%raw(`import './App.css';`)

type todo = {
  title: string,
  isDone: bool,
}

type state = {todoList: array<todo>, inputValue: string}

let initialState: state = {
  todoList: [],
  inputValue: "",
}

//give a action items(todo)
type actions = AddTodo | ClearTodos | InputChanged(string) | MarkDone(int)

let reducer = (state, action) => {
  switch action {
  | AddTodo => {
      inputValue: "",
      todoList: state.todoList->Js.Array2.concat([
        {
          title: state.inputValue,
          isDone: false,
        },
      ]),
    }
  | ClearTodos => {
      ...state,
      todoList: [],
    }
  | InputChanged(newValue) => {
      ...state,
      inputValue: newValue,
    }
  | MarkDone(index) => {
      ...state,
      todoList: state.todoList->Belt.Array.mapWithIndex((i, todo) => {
        if i == index {
          {
            ...todo,
            isDone: !todo.isDone,
          }
        } else {
          todo
        }
      }),
    }
  }
}

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let handleInput = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    // same with 'dispatch(InputChanged(newValue))'
    newValue->InputChanged->dispatch
  }

  <div className="container">
    <div className="inner">
      <div className="header">
        <div
          style={ReactDOM.Style.make(
            ~fontSize="6rem",
            ~fontWeight="600",
            ~marginBottom="2rem",
            ~lineHeight="1em",
            ~color="#ececec",
            ~textTransform="lowercase",
            ~textAlign="center",
            (),
          )}>
          {"todos"->React.string}
        </div>
      </div>
      <form onSubmit={handleInput} className="form-container">
        <input
          className="input-text"
          placeholder="Add todo..."
          value={state.inputValue}
          type_="text"
          onChange={handleInput}
        />
      </form>
      <button onClick={_ => dispatch(AddTodo)}> {"Add"->React.string} </button>
      <button onClick={_ => dispatch(ClearTodos)}> {"Clear"->React.string} </button>
      <ul>
        {state.todoList
        ->Belt.Array.mapWithIndex((i, todo) => {
          <div
            onClick={_ => i->MarkDone->dispatch}
            key={todo.title}
            style={ReactDOM.Style.make(
              ~fontStyle={todo.isDone ? "italic" : ""},
              ~textDecoration={todo.isDone ? "line-through" : "initial"},
              ~color="#595959",
              ~opacity={todo.isDone ? "0.4" : "1"},
              ~padding="1rem",
              ~fontSize="1.5rem",
              ~margin="1rem 0",
              (),
            )}>
            {todo.title->React.string}
          </div>
        })
        ->React.array}
      </ul>
    </div>
  </div>
}
