module Container = {
  @module("react-bootstrap") @react.component
  external make: (~children: React.element, ~className: string=?) => React.element = "Container"
}

module Row = {
  @module("react-bootstrap") @react.component
  external make: (
    ~xs: int=?,
    ~sm: int=?,
    ~md: int=?,
    ~lg: int=?,
    ~xl: int=?,
    ~xxl: int=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "Row"
}

module Col = {
  @module("react-bootstrap") @react.component
  external make: (
    ~xs: int=?,
    ~sm: int=?,
    ~md: int=?,
    ~lg: int=?,
    ~xl: int=?,
    ~xxl: int=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "Col"
}
