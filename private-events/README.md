# Private Events

Project Private Events for The Odin Project's [Projects: Active Record Associations](http://www.theodinproject.com/ruby-on-rails/associations).

Associations between Users and Events are designed and implemented for this project.  A User can create multiple Events (each of which belong to one User) and a User can attend multiple Events (each of which can be attended by multiple Users).

The focus here is on the associations between the models and so creating Users and Events, as well as signing in as a User, is made simple.  Only a name is required to create a User (or sign in as a User) and only a description and date are required to create an Event, but an Event can only be created by a signed in User.

The displays for Users and Events are grouped to show which Events are associated with which User and vice versa. Furthermore, Events are divided into past and upcoming events.
Finally a User may invite other users to an Event that they created from the Event's display page.
