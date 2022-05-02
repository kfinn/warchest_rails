module ApplicationHelper
  def react_component(name, **props)
    tag(
      'div',
      {
        "data-react-component" => {
          name: name,
          props: props.deep_transform_keys { |k| k.to_s.camelize(:lower) }
        }.to_json
      }
    )
  end
end
