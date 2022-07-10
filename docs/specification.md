## Specification
A `diml` document provides a simple markup format for dictating notes in a way to preserve formatting for transformation to a presentable format (e.g. markdown). An example of DiML is below:

```
section. School Diary; heading. My First Day At School; point. I went to the lunch room; point. I went to the class room; point. I went to the nurse's room; heading. My Second Day At School; point. I went to the drama room; point. I went to the clown room;
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
