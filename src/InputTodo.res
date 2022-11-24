//open ReactNative

module FaPlusCircle = {
  @module("react-icons/fa") @react.component
  external make: React.element = "FaPlusCircle"
}

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(TodoComponent.reducer, TodoComponent.initialState)

  //let {inputValue, todoList} = state

  let onChange = e => {
    let value = ReactEvent.Form.target(e)["value"]

    value->InputChange->dispatch
  }

  let handleSubmit = e => {
    ReactEvent.Form.preventDefault(e)

    //let length = Js.String.length(state.inputValue)

    //if length > 0 {
    //  dispatch(AddTodo)
    //} else {
    //  Alert.alert(~message="Please write item")
    //}
  }

  <>
    <form onSubmit={handleSubmit} className="form-container">
      <input
        className="input-text"
        placeholder="Add todo..."
        value={state.inputValue}
        type_="text"
        onChange={onChange}
      />
      <button className="input-submit" onClick={_ => dispatch(AddTodo)}>
        <FaPlusCircle />
      </button>
    </form>
    //{if todoList->Js.Array2.length == 0 {
    //  <p> {React.string("You haven't added anything to your list yet.")} </p>
    //} else {
    //  <List>
    //    {todoList
    //    ->Js.Array2.mapi((todo, i) => <Item key={i->Js.Int.toString} todo dispatch i />)
    //    ->React.array}
    //  </List>
    //}}
  </>
}
