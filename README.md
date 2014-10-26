Stencil
=======

Stencil is a simple and powerful template language for Swift. It provides a
syntax similar to Django and Jinja2. If you're familiar with these, you will
feel right at home with Stencil.

### Example

```html+django
There are {{ articles.count }} articles.

{% for article in articles %}
  - {{ article.title }} by {{ article.author }}.
{% endfor %}
```

```swift
let context = Context(dictionary: [
    "articles": [
        [ "title": "Migrating from OCUnit to XCTest", "author": "Kyle Fuller" ],
        [ "title": "Memory Management with ARC", "author": "Kyle Fuller" ],
    ]
])

let template = Template(named: "template.stencil")
let result = template.render(context)

if let error = result.error {
    println("There was an error rendering your template (\(error)).")
}

println("\(result.string)")
```

## Philosophy

Stencil follows the same philosophy of Django:

> If you have a background in programming, or if you’re used to languages which
> mix programming code directly into HTML, you’ll want to bear in mind that the
> Django template system is not simply Python embedded into HTML. This is by
> design: the template system is meant to express presentation, not program
> logic.

## Templates

### Variables

A variable can be defined in your template using the following:

```html+django
{{ variable }}
```

Stencil will look up the variable inside the current variable context and
evaluate it. When a variable contains a dot, it will try doing the
following lookup:

- Context lookup
- Dictionary lookup
- Array lookup (first, last, count, index)
- Key value coding lookup

For example, if `people` was an array:

```html+django
There are {{ people.count }} people, {{ people.first }} is first person.
Followed by {{ people.1 }}.
```

### Tags

Tags are a mechanism to execute a piece of code which can allows you to have
control flow within your template.

```html+django
{% if variable %}
  {{ variable }} was found.
{% endif %}
```

A tag can also effect the context and define variables as follows:

```html+django
{% for item in items %}
  {{ item }}
{% endfor %}
```

Stencil has a couple of built in tags which are listed below. You will also be
able to use the Stencil API to build your own in future versions. This is
tracked by a ticket [#6](https://github.com/kylef/Stencil/issues/6).

#### for

A for loop allows you to iterate over an array found by variable lookup.

```html+django
{% for item in items %}
  {{ item }}
{% empty %}
  There we're no items.
{% endfor %}
```

#### if

```html+django
{% if variable %}
  The variable was found in the current context.
{% else %}
  The variable was not found.
{% endif %}
```

#### ifnot

```html+django
{% ifnot variable %}
  The variable was NOT found in the current context.
{% else %}
  The variable was found.
{% endif %}
```

### Comments

To comment out part of your template you can use the following syntax:

```html+django
{# My comment is completely hidden #}
```

## License

Stencil is licensed under the BSD license. See [LICENSE](LICENSE) for more
info.
