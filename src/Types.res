type rec reactNode =
  | Text(string)
  | Int(int)
  | Float(float)
  | ReactElem(React.element)
  | Children(array<reactNode>)
  | Empty

type size = [#sm | #lg]

type variant = [
  | #primary
  | #secondary
  | #success
  | #danger
  | #warning
  | #info
  | #dark
  | #light
]
