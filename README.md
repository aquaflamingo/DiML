# Diml

Prototype [Dictation Markup Language](https://github.com/aquaflamingo/random-ideas/issues/6)

## Specification
A `diml` document provides a simple markup format for dictating notes in a way to preserve formatting for transformation to a presentable format (e.g. markdown). An example of DiML is below:

```
section. School Diary; heading. My First Day At School; point. I went to the lunch room; point. I went to the class room; point. I went to the nurse's room; heading. My Second Day At School; point. I went to the drama room; point. I went to the clown room;
```

Transcribes to:
```markdown
# School Diary
## My First Day At School
* I went to the lunch room
* I went to the class room
* I went to the nurse's room
## My Second Day At School
* I went to the drama room
* I went to the clown room
```

As you can see the above document isn't formatted but has the necessary keyword to parse the content and organize it into the format desired. This is helpful in the case of transcription of hand written notes via dictation.

See originating idea here: https://github.com/aquaflamingo/random-ideas/issues/6

## DiML document
A DiML document is a Tree data structure composed of _n_ children with at most height of 3 organized in a hierarchy: Section > Heading > Point.

Each node in the tree must be one of these elements described below.

Example of a DiML document:
```
root/
├─ section/
│  ├─ heading/
│  │  ├─ point
│  ├─ heading 2/
│  │  ├─ point
├─ section 2/
```

## Basic Elements
There are three basic elements to DiML:

1. Section: a content element for separating independent blocks of content in notes
2. Heading: a content element for separating themes for notes
3. Point: a content element for capturing a point in note notes

### Sections
An individual `.diml` document can have 1 to _n_ number of `Section`. `Section` cannot be children of other `Sections`. In other words, a `Section` can only be a siblings.

A `Section` can have 1 to _n_ child `Heading` elements.

### Headings
An individual `Heading` document can have 1 to _n_ number of `Point` elements. `Heading` cannot be children of other `Heading` elements. In other words, a `Heading` elements can only be a siblings.

A `Heading` can have 1 to _n_ child `Point` elements.

### Points
A `Point` can only be a child under a `Heading`. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'diml'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install diml

## Usage
Assuming you have a `.diml` file according to the specification, you can copy the example of parsing `diml` to `markdown` in the example file:

```bash
ruby examples/parse_md.rb -f examples/easy.diml
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/diml.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
