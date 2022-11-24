let useToggle = (~default=false: bool, ()) => {
  let (toggled, setToggled) = React.useState(_ => default)

  let toggle = _ => setToggled(current => !current)

  (toggled, toggle)
}
