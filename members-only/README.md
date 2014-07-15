# Members Only

Simple Rails app to practice authentication and authorization for The Odin Project's [Projects: Authentication](http://www.theodinproject.com/ruby-on-rails/authentication).

This project creates users (or members) and posts, and uses authentication to limit post creation to member and viewing of post authors to members who are signed in (using session).

Users are created from the `$ rails console` with `name`, `email`, `password`, and `password_confirmation` fields; one can create a user with, for example, `> user = User.create(name: "foo", email: "foo@bar.com", password: "foobar", password_confirmation: "foobar")`.

Users created on the command line become members and they are the only ones authorized to created posts or view the authors of posts...you will have to signin to access these features.
