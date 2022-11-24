type todo = {
  title: string,
  isDone: bool,
}

type state = {todoList: array<todo>, inputValue: string}

let initialState: state = {
  todoList: [],
  inputValue: "",
}

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

module FaPlusCircle = {
  @module("react-icons/fa") @react.component
  external make: React.element = "FaPlusCircle"
}

module FaTrash = {
  @module("react-icons/fa") @react.component
  external make: React.element = "FaTrash"
}

@react.component
let default = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let handleInput = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    newValue->InputChanged->dispatch
  }

  <div className="container">
    <div className="inner">
      <div
        className="header"
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
      <div className="form-container">
        <input
          className="input-text"
          placeholder="Add todo..."
          value={state.inputValue}
          type_="text"
          onChange={handleInput}
        />
        <button className="input-submit" onClick={_ => dispatch(AddTodo)}>
          <FaPlusCircle />
        </button>
      </div>
      <ul className="todoslist">
        // <li className="item">
        {state.todoList
        ->Belt.Array.mapWithIndex((i, todo) => {
          <li
            className="item"
            onClick={_ => i->MarkDone->dispatch}
            key={todo.title}
            style={ReactDOM.Style.make(
              ~fontStyle={todo.isDone ? "italic" : "bold"},
              ~textDecoration={todo.isDone ? "line-through" : "initial"},
              ~opacity={todo.isDone ? "0.4" : "1"},
              ~color={todo.isDone ? "#595959" : "black"},
              ~padding="1rem",
              //~fontSize="1.5rem",
              (),
            )}>
            {todo.title->React.string}
            <button onClick={_ => dispatch(ClearTodos)}>
              <FaTrash />
            </button>
          </li>
        })
        ->React.array}
        // </li>
      </ul>
    </div>
  </div>
}
