@react.component
let default = () => {
  let headerStyle = {
    ReactDOM.Style.make(~padding="20px 0", ~lineHeight="1.5em", ())
  }

  <>
    <header style={headerStyle}>
      <h1
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
      </h1>
    </header>
  </>
}
