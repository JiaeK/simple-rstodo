//open MaterialUi
//open Icons
//open ReactNative

@module external styles: {..} = "../styles/TodoItem.module.css"

module FaTrash = {
  @module("react-icons/fa") @react.component
  external make: React.element = "FaTrash"
}

//@module("@react-native-community/checkbox")
@react.component
let make = (~todo: TodoComponent.todo, ~dispatch: TodoComponent.action => unit, ~i: int) => {
  let {isDone, content} = todo

  let (value, setValue) = React.useState(_ => content)

  //let onChange = e => {
  //  let value = ReactEvent.Form.target(e)["value"]

  //  setValue(value)
  //}

  let handleUpdate = _ => {value, i}->SetUpdate->dispatch

  let handleDelete = _ => ClearTodos->dispatch

  let handleToggle = _ => i->Toggle->dispatch

  //let handleListItemClick = _ => {
  //  if !isDone {
  //    handleToggle()
  //  }
  //}

  let handleCancel = _ => {
    handleToggle()

    setValue(_ => content)
  }

  //let completedStyle = {
  //  ReactDOM.Style.make(
  //    ~fontStyle="italic",
  //    ~color="#595959",
  //    ~opacity="0.4",
  //    ~textDecoration="line-through",
  //    (),
  //  )
  //}

  let handleInput = e => {
    let value = ReactEvent.Form.target(e)["value"]
    value->InputChange->dispatch
  }

  <li className={styles["item"]}>
    //<ListItem button={true} className={styles["item"]} onClick={handleListItemClick}>
    {if isDone {
      <>
        <div onDoubleClick={handleUpdate}>
          //style={viewMode}//
          //input
          // type_="checkbox"
          // className={styles.checkbox}
          // checked={isDone} //completed//
          // onChange={() => props.handleUpdateProps(id)}
          ///>
          <input
            type_="text"
            //style={editMode}
            className={styles["textInput"]}
            value={content}
            onChange={handleInput}
            onKeyDown={handleDelete}
          />
          <button onClick={handleCancel}>
            <FaTrash /> //style={[color: #FFA500, fontSize: "16px"]}
          </button>
          //<span style={isDone ? completedStyle : ""}> {title} </span>
        </div>
        //<TextField onChange value={TextField.Value.string(value)} autoFocus={true} />
        //<ListItemIcon>
        //  <Tooltip title={React.string("Confirm")}>
        //    <Check onClick={handleUpdate} />
        //  </Tooltip>
        //</ListItemIcon>
        //<ListItemSecondaryAction>
        //  <Tooltip title={React.string("Cancel")}>
        //    <IconButton edge={IconButton.Edge._end} onClick={handleCancel}>
        //      <Cancel />
        //    </IconButton>
        //  </Tooltip>
        //</ListItemSecondaryAction>
      </>
    } else {
      <>
        <div onDoubleClick={handleUpdate}>
          <input
            type_="text"
            //style={editMode}
            className={styles["completedStyle"]}
            value={content}
            onChange={handleInput}
            onKeyDown={handleDelete}
          />
          <button onClick={handleCancel}>
            <FaTrash /> //style={[color: #FFA500, fontSize: "16px"]}
          </button>
          //<span style={isDone ? completedStyle : ""}> {title} </span>
        </div>
        //<ListItemText
        //  primary={React.string(content)} style={ReactDOM.Style.make(~cursor="pointer", ())}
        ///>
        //<ListItemSecondaryAction>
        //  <Tooltip title={React.string("Delete")}>
        //    <IconButton edge={IconButton.Edge._end} onClick={handleDelete}>
        //      <Delete />
        //    </IconButton>
        //  </Tooltip>
        //</ListItemSecondaryAction>
      </>
    }}
    //</ListItem>
  </li>
}
