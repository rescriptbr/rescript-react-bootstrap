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

module Alert = {
  type transition = ElemType(React.element) | Bool(bool)

  @module("react-bootstrap") @react.component
  external make: (
    ~closeLabel: string=?,
    ~closeVariant: [#white]=?,
    ~dismissible: bool=?,
    ~onClose: (~show: bool) => bool,
    ~show: bool=?,
    ~transition: transition=?,
    ~variant: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Alert"

  module Heading = {
    @module("react-bootstrap") @scope("Alert") @react.component
    external make: (
      ~_as: string=?,
      ~children: React.element,
      ~className: string=?,
      ~bsPrefix: string,
    ) => React.element = "Heading"
  }

  module Link = {
    @module("react-bootstrap") @scope("Alert") @react.component
    external make: (
      ~_as: string=?,
      ~children: React.element,
      ~className: string=?,
      ~bsPrefix: string,
    ) => React.element = "Link"
  }
}

module Accordion = {
  @module("react-bootstrap") @react.component
  external make: (
    ~activeKey: string=?,
    ~_as: string=?,
    ~defaultActiveKey: string=?,
    ~flush: bool=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Accordion"

  module Item = {
    @module("react-bootstrap") @scope("Accordion") @react.component
    external make: (
      ~_as: string=?,
      ~eventKey: string,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Item"
  }

  module Header = {
    @module("react-bootstrap") @scope("Accordion") @react.component
    external make: (
      ~_as: string=?,
      ~onClick: ReactEvent.Mouse.t => unit,
      ~bsPrefix: string=?,
    ) => React.element = "Header"
  }

  module Body = {
    @module("react-bootstrap") @scope("Accordion") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Body"
  }

  module Button = {
    @module("react-bootstrap") @scope("Accordion") @react.component
    external make: (
      ~_as: string=?,
      ~onClick: ReactEvent.Mouse.t => unit,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Button"

    @module("react-bootstrap") @scope("AccordionButton") @val
    external useAccordionButton: (
      ~eventKey: string,
      ~onClick: unit => unit,
      ReactEvent.Mouse.t,
    ) => unit = "useAccordionButton"
  }

  module Collapse = {
    @module("react-bootstrap") @scope("Accordion") @react.component
    external make: (
      ~_as: string=?,
      ~children: React.element,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Collapse"
  }
}

module Badge = {
  @module("react-bootstrap") @react.component
  external make: (
    ~_as: string=?,
    ~bg: variant=?,
    ~pill: bool=?,
    ~text: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Badge"
}

module Breadcrumb = {
  @module("react-bootstrap") @react.component
  external make: (
    ~_as: string=?,
    ~label: string=?,
    ~listProps: {.}=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Breadcrumb"

  module Item = {
    @module("react-bootstrap") @scope("Breadcrumb") @react.component
    external make: (
      ~active: bool=?,
      ~_as: string=?,
      ~href: string=?,
      ~linkAs: string=?,
      ~linkProps: {.}=?,
      ~target: string=?,
      ~title: reactNode=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Item"
  }
}

module Button = {
  type buttonType = [#button | #reset | #submit | #null]

  @module("react-bootstrap") @react.component
  external make: (
    ~active: bool=?,
    ~_as: string=?,
    ~className: string=?,
    ~disabled: bool=?,
    ~href: string=?,
    ~size: size=?,
    ~_type: buttonType=?,
    ~variant: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Button"
}

module ToggleButtonGroup = {
  type value<'a> = Value('a) | Values(array<'a>)

  @module("react-bootstrap") @react.component
  external make: (
    ~name: string=?,
    ~onChange: (value<'a>, ReactEvent.Form.t) => unit,
    ~size: size=?,
    ~_type: [#checkbox | #radio]=?,
    ~value: 'a,
    ~vertical: bool=?,
    ~className: string=?,
    ~children: React.element=?,
  ) => React.element = "ToggleButtonGroup"
}

module ToggleButton = {
  type value<'a> = Text(string) | Int(int) | Float(float) | Arr(array<'a>)

  @module("react-bootstrap") @react.component
  external make: (
    ~checked: bool=?,
    ~disabled: bool=?,
    ~id: string,
    ~inputRef: ReactDOM.Ref.t=?,
    ~name: string=?,
    ~onChange: ReactEvent.Form.t => unit=?,
    ~_type: [#checkbox | #radio]=?,
    ~value: value<'a>,
    ~bsPrefix: string=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "ToggleButton"
}

module ButtonGroup = {
  @module("react-bootstrap") @react.component
  external make: (
    ~_as: string=?,
    ~role: string=?,
    ~size: size=?,
    ~vertical: bool=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "ButtonGroup"
}

module ButtonToolbar = {
  @module("react-bootstrap") @react.component
  external make: (
    ~role: string=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "ButtonToolbar"
}

module Card = {
  @module("react-bootstrap") @react.component
  external make: (
    ~_as: string=?,
    ~bg: variant=?,
    ~body: bool=?,
    ~border: variant=?,
    ~text: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Card"

  module Body = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Body"
  }

  module Footer = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Footer"
  }

  module Header = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Header"
  }

  module Img = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~src: string,
      ~variant: [#top | #bottom]=?,
      ~className: string=?,
      ~bsPrefix: string=?,
    ) => React.element = "Img"
  }

  module ImgOverlay = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "ImgOverlay"
  }

  module Link = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~href: string,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Link"
  }

  module Subtitle = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Subtitle"
  }

  module Text = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Text"
  }

  module Title = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Title"
  }

  module CardGroup = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "CardGroup"
  }

  module CardColumns = {
    @module("react-bootstrap") @scope("Card") @react.component
    external make: (
      ~_as: string=?,
      ~className: string,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "CardColumns"
  }
}

module Carousel = {
  type pause = Hover([#hover]) | False(bool)

  @module("react-bootstrap") @react.component
  external make: (
    ~activeIndex: int=?,
    ~_as: string=?,
    ~controls: bool=?,
    ~fade: bool=?,
    ~indicatorLabels: array<'a>=?,
    ~indicators: bool=?,
    ~interval: bool=?,
    ~keyboard: bool=?,
    ~nextIcon: reactNode=?,
    ~nextLabel: string=?,
    ~onSelect: (~eventKey: int, ~event: option<ReactEvent.Selection.t>) => unit,
    ~onSlid: (~eventKey: int, ~direction: [#start | #end]) => unit,
    ~onSlide: (~eventKey: int, ~direction: [#start | #end]) => unit,
    ~pause: [#hover],
    ~prevIcon: reactNode=?,
    ~prevLabel: string=?,
    ~slide: bool=?,
    ~touch: bool=?,
    ~variant: [#dark]=?,
    ~wrap: bool=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Carousel"

  module Item = {
    @module("react-bootstrap") @scope("Carousel") @react.component
    external make: (
      ~_as: string=?,
      ~interval: int=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Item"
  }

  module Caption = {
    @module("react-bootstrap") @scope("Carousel") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Caption"
  }
}

module CloseButton = {
  @module("react-bootstrap") @react.component
  external make: (
    ~\"aria-label": string=?,
    ~onClick: ReactEvent.Form.t => unit=?,
    ~className: string=?,
    ~children: React.element=?,
    ~variant: [#white]=?,
  ) => React.element = "CloseButton"
}

module DropdownButton = {
  @module("react-bootstrap") @react.component
  external make: (
    ~align: [#start | #end]=?,
    ~disabled: bool=?,
    ~href: string=?,
    ~id: string=?,
    ~menuRole: string=?,
    ~menuVariant: [#dark]=?,
    ~onClick: ReactEvent.Form.t => unit=?,
    ~renderMenuOnMount: bool=?,
    ~rootCloseEvent: string=?,
    ~size: string=?,
    ~title: string,
    ~variant: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "DropdownButton"
}

module SplitButton = {
  @module("react-bootstrap") @react.component
  external make: (
    ~align: [#start | #end]=?,
    ~disabled: bool=?,
    ~href: string=?,
    ~id: string,
    ~menuRole: string=?,
    ~onClick: ReactEvent.Form.t => unit=?,
    ~rootCloseEvent: string=?,
    ~size: size=?,
    ~target: string=?,
    ~title: string,
    ~toggleLabel: string=?,
    ~_type: string=?,
    ~variant: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "SplitButton"
}

module Dropdown = {
  type autoClose = Bool(bool) | Side([#outside | #inside])
  type drop = [#up | #start | #end | #down]
  type focus = Bool(bool) | Keyboard([#keyboard])

  type toggleMetadata = {source: [#select | #click | #rootClose | #keydown]}

  @module("react-bootstrap") @react.component
  external make: (
    ~align: [#start | #end]=?,
    ~_as: string=?,
    ~autoClose: autoClose=?,
    ~drop: drop=?,
    ~flip: bool=?,
    ~focusFirstItemOnShow: focus=?,
    ~navbar: bool=?,
    ~onSelect: (~eventKey: string, ~event: ReactEvent.Selection.t) => unit=?,
    ~onToggle: (~isOpen: bool, ~event: ReactEvent.Synthetic.t, ~metadata: toggleMetadata) => unit=?,
    ~show: bool=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "Dropdown"

  module Toggle = {
    @module("react-bootstrap") @scope("Dropdown") @react.component
    external make: (
      ~_as: string=?,
      ~childBsPrefix: string=?,
      ~id: string=?,
      ~split: bool=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Toggle"
  }

  module Menu = {
    @module("react-bootstrap") @scope("Dropdown") @react.component
    external make: (
      ~align: [#start | #end]=?,
      ~_as: string=?,
      ~flip: bool=?,
      ~onSelect: (~eventKey: string, ~event: ReactEvent.Selection.t) => unit=?,
      ~popperConfig: {.}=?,
      ~renderOnMount: bool=?,
      ~rootCloseEvent: [#click | #mousedown]=?,
      ~show: bool=?,
      ~variant: variant=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Menu"
  }

  module Item = {
    @module("react-bootstrap") @scope("Dropdown") @react.component
    external make: (
      ~active: bool=?,
      ~_as: string=?,
      ~disabled: bool=?,
      ~eventKey: string=?,
      ~href: string=?,
      ~onClick: ReactEvent.Mouse.t,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string=?,
    ) => React.element = "Item"
  }

  module Header = {
    @module("react-bootstrap") @scope("Dropdown") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Header"
  }

  module Divider = {
    @module("react-bootstrap") @scope("Dropdown") @react.component
    external make: (
      ~_as: string=?,
      ~className: string=?,
      ~children: React.element,
      ~bsPrefix: string,
    ) => React.element = "Divider"
  }
}

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

module Navbar = {
  @module("react-bootstrap") @react.component
  external make: (
    ~id: string=?,
    ~_as: string=?,
    ~children: React.element,
    ~bg: string=?,
    ~expand: [#sm | #md | #lg | #xl | #xxl],
    ~expanded: bool=?,
    ~fixed: [#top | #bottom],
    ~role: string=?,
    ~variant: [#light | #dark],
    ~collapseOnSelect: bool=?,
    ~sticky: string=?,
    ~className: string=?,
  ) => React.element = "Navbar"

  module Brand = {
    @module("react-bootstrap") @scope("Navbar") @react.component
    external make: (
      ~is: string=?,
      ~_as: string=?,
      ~href: string,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Brand"
  }

  module Collapse = {
    @module("react-bootstrap") @scope("Navbar") @react.component
    external make: (
      ~id: string=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Collapse"
  }

  module Toggle = {
    @module("react-bootstrap") @scope("Navbar") @react.component
    external make: (
      ~id: string=?,
      ~_as: string=?,
      ~children: React.element=?,
      ~label: string=?,
      ~\"aria-controls": string=?,
      ~className: string=?,
    ) => React.element = "Toggle"
  }
}

module Nav = {
  @module("react-bootstrap") @react.component
  external make: (
    ~id: string=?,
    ~activeKey: string=?,
    ~className: string=?,
    ~navbarScroll: bool=?,
    ~_as: string=?,
    ~fill: bool=?,
    ~justify: bool=?,
    ~navbar: bool=?,
    ~role: string=?,
    ~variant: [#tabs | #pills],
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "Nav"

  module Item = {
    @module("react-bootstrap") @scope("Nav") @react.component
    external make: (
      ~id: string=?,
      ~className: string=?,
      ~children: React.element,
      ~_as: string=?,
    ) => React.element = "Item"
  }

  module Link = {
    @module("react-bootstrap") @scope("Nav") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element,
      ~_as: string=?,
      ~active: bool=?,
      ~disabled: bool=?,
      ~href: string,
      ~className: string=?,
    ) => React.element = "Link"
  }
}

module Form = {
  @module("react-bootstrap") @react.component
  external make: (
    ~_ref: ReactDOM.Ref.t=?,
    ~_as: string=?,
    ~validated: bool=?,
    ~children: React.element,
    ~className: string=?,
  ) => React.element = "Form"

  module Group = {
    @module("react-bootstrap") @scope("Form") @react.component
    external make: (
      ~_ref: ReactDOM.Ref.t=?,
      ~_as: string=?,
      ~controlId: string=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Group"
  }

  module Label = {
    @module("react-bootstrap") @scope("Form") @react.component
    external make: (
      ~_ref: ReactDOM.Ref.t=?,
      ~_as: string=?,
      ~column: [#sm | #lg]=?,
      ~visuallyHidden: bool=?,
      ~htmlFor: string=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Label"
  }

  module Text = {
    @module("react-bootstrap") @scope("Form") @react.component
    external make: (
      ~_ref: ReactDOM.Ref.t=?,
      ~_as: string=?,
      ~muted: bool=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Text"
  }

  module Control = {
    @module("react-bootstrap") @scope("Form") @react.component
    external make: (
      ~_ref: ReactDOM.Ref.t=?,
      ~_as: string=?,
      ~disabled: bool=?,
      ~htmlSize: int=?,
      ~id: string=?,
      ~isValid: bool=?,
      ~isInvalid: bool=?,
      ~plainText: bool=?,
      ~readOnly: bool=?,
      ~size: [#sm | #lg]=?,
      ~_type: string=?,
      ~value: string=?,
      ~className: string=?,
      ~onChange: ReactEvent.Form.t=?,
    ) => React.element = "Control"

    module Feedback = {
      @module("react-bootstrap") @scope(("Form", "Control")) @react.component
      external make: (
        ~_as: string=?,
        ~tooltip: bool=?,
        ~_type: [#valid | #invalid]=?,
        ~className: string=?,
        ~children: React.element,
      ) => React.element = "Feedback"
    }
  }

  module Check = {
    @module("react-bootstrap") @scope("Form") @react.component
    external make: (
      ~_ref: ReactDOM.Ref.t=?,
      ~_as: string=?,
      ~children: React.element=?,
      ~disabled: bool=?,
      ~inline: bool=?,
      ~isInvalid: bool=?,
      ~isValid: bool=?,
      ~title: string=?,
      ~className: string=?,
    ) => React.element = "Check"

    module Input = {
      @module("react-bootstrap") @scope(("Form", "Check")) @react.component
      external make: (
        ~_as: string=?,
        ~id: string=?,
        ~isInvalid: bool=?,
        ~isValid: bool=?,
        ~className: string=?,
        ~_type: [#radio | #checkbox]=?,
      ) => React.element = "Input"
    }

    module Label = {
      @module("react-bootstrap") @scope(("Form", "Check")) @react.component
      external make: (~htmlFor: string, ~className: string=?) => React.element = "Label"
    }
  }

  module Select = {
    @module("react-bootstrap") @scope("Form") @react.component
    external make: (
      ~disabled: bool=?,
      ~htmlSize: int=?,
      ~isInvalid: bool=?,
      ~isValid: bool=?,
      ~onChange: ReactEvent.Form.t=?,
      ~className: string=?,
      ~size: [#sm | #lg]=?,
    ) => React.element = "Select"
  }

  module FloatingLabel = {
    @module("react-bootstrap") @react.component
    external make: (
      ~_as: string=?,
      ~controlId: string=?,
      ~label: string=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "FloatingLabel"
  }
}

module InputGroup = {
  @module("react-bootstrap") @react.component
  external make: (
    ~_as: string=?,
    ~hasValidation: bool=?,
    ~size: [#sm | #lg]=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "InputGroup"
}
