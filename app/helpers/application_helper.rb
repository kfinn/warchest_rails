module ApplicationHelper
  def react_component(name, **props)
    tag(
      'div',
      {
        "data-react-component" => {
          name: 'HelloWorld',
          props: props.deep_transform_keys { |k| k.to_s.camelize(:lower) }
        }.to_json
      }
    )
  end
end
