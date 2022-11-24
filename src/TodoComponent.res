type todo = {content: string, isDone: bool}

type state = {
  todoList: array<todo>,
  inputValue: string,
}

let initialState = {todoList: [], inputValue: ""}

type action =
  AddTodo | ClearTodos | InputChange(string) | SetUpdate({value: string, i: int}) | Toggle(int)

let reducer = (state, action) =>
  switch action {
  | AddTodo => {
      inputValue: "",
      todoList: state.todoList->Js.Array2.concat([{content: state.inputValue, isDone: false}]),
    }
  | ClearTodos => {
      ...state,
      todoList: [],
    }
  | InputChange(value) => {...state, inputValue: value}
  | SetUpdate({value, i}) => {
      ...state,
      todoList: state.todoList->Js.Array2.mapi((todo, index) => {
        if i === index {
          {content: value, isDone: false}
        } else {
          todo
        }
      }),
    }
  | Toggle(i) => {
      ...state,
      todoList: state.todoList->Js.Array2.mapi((e, index) => {
        let isDone = if i === index {
          !e.isDone
        } else {
          false
        }

        {...e, isDone}
      }),
    }
  }

//@react.component
//let make = () => {
//  let (state, dispatch) = React.useReducer(reducer, initialState)
//
//  let handleInput = e => {
//    let newValue = ReactEvent.Form.target(e)["value"]
//    newValue->InputChanged->dispatch
//  }
//
//  <div className="container">
//    <div className="inner">
//      <Header />
//      <InputTodo addTodoProps={inputChange} />
//      <ul>
//        <TodoItem
//          key={todo.id}
//          todo={todo}
//          addTodo={props.addtodoProps}
//          clearTodoProps={props.clearTodoProps}
//          setUpdate={props.setUpdate}
//        />
//      </ul>
//    </div>
//  </div>
//}
