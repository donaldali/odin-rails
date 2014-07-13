# Basic Forms

Building simple forms with pure HTML, form helpers, and form builders for The Odin Project's [Projects: Forms](http://www.theodinproject.com/ruby-on-rails/forms).

Forms are created for a User model with `username`, `email`, and `password`.  Only `new`, `create`, `edit`, and `update` actions are implemented, along with the routes to support them.

Forms are created initially with pure HTML to see what Rails does behind the scenes, like the `accept-charset` and `authenticity_token`, as well as seeing how parameters are submitted. `form_tag` with `*_tag` helpers, and later `form_for`, are then used to observe how Rails makes form development easier or more convenient.
