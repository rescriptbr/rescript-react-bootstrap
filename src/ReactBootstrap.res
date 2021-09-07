module Layout = Layout

module Accordion = Accordion
module Alert = Alert
module Badge = Badge
module Breadcrumb = Breadcrumb
module Button = Button
module ToggleButtonGroup = ToggleButtonGroup
module ToggleButton = ToggleButton
module ButtonGroup = ButtonGroup
module ButtonToolbar = ButtonToolbar
module Card = Card
module Carousel = Carousel
module CloseButton = CloseButton
module DropdownButton = DropdownButton
module SplitButton = SplitButton
module Dropdown = Dropdown
module Figure = Figure
module FigureImage = FigureImage
module FigureCaption = FigureCaption
module Form = Form
module InputGroup = InputGroup
module Image = Image

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
