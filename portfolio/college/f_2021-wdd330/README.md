# WDD330 - Front End Development 2

## Recommendations from the Teacher

- If you really want to get into design patterns and the like, look at the Microsoft Enterprise architecture, which I believe you already have. Then Look at clean code architectures and vertical slice. There are lots of good you tube videos on these. A combination of Microsofts enterprise and a middle ground between clean code Domain driven design and vertical slice has been a really nice spot for apps I have worked on.
- Two things I have learned. Always prefer convention over configuration and composition over inheritance.
  - Convention is like when using Entity framework, if you have a class with a property Id, it will pick it up as the Id.  In automapper if you keep the property names the same, they automatically map for you, or MVC, it expects Views to be in the View folder and Controllers to be in the Controller folder, and if you name a file properly it picks it up properly.
  - Composition is Javascript prototypal inheritance, or C# its using interfaces to compose classes with functionality and keeping inheritance really shallow.
  - Vertical slice says to take functionality in a vertical slice for view, controller, view model, model.  You do little to no sharing of any objects, so when things change (and they will), it does not affect any other slice.  It feels wrong and against DRY principles, but it is not.  And it makes maintenance much easier.